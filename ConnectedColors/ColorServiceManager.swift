//
//  ColorServiceManager.swift
//  ConnectedColors
//
//  Created by Ralf Ebert on 10/02/2017.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import MultipeerConnectivity

var playerTwo = "null"
var playerThree = "null"
var playerFour = "null"

var startOne = false
var startTwo = false
var startThree = false
var startFour = false
var gameStatus = 0
let myPlayerID = String(Int(arc4random_uniform(32766) + 1))
var peerNameList: [String] = []


protocol ColorServiceManagerDelegate {

    func connectedDevicesChanged(manager : ColorServiceManager, connectedDevices: [String], peerCount: Int)
    func colorChanged(manager : ColorServiceManager, colorString: String, senderPeerID: String)

}

class ColorServiceManager : NSObject {

    // Service type must be a unique string, at most 15 characters long
    // and can contain only ASCII lowercase letters, numbers and hyphens.
    private let ColorServiceType = "example-color"

    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)

    private let serviceAdvertiser : MCNearbyServiceAdvertiser
    private let serviceBrowser : MCNearbyServiceBrowser

    var delegate : ColorServiceManagerDelegate?

    lazy var session : MCSession = {
        let session = MCSession(peer: self.myPeerId, securityIdentity: nil, encryptionPreference: .optional)
        session.delegate = self
        return session
    }()

    override init() {
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: ColorServiceType)
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: ColorServiceType)

        super.init()

        self.serviceAdvertiser.delegate = self
        self.serviceAdvertiser.startAdvertisingPeer()

        self.serviceBrowser.delegate = self
        self.serviceBrowser.startBrowsingForPeers()
    }

    func send(colorName : String) {
        NSLog("%@", "sendColor: \(colorName) to \(session.connectedPeers.count) peers")

        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(colorName.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            }
            catch let error {
                NSLog("%@", "Error for sending: \(error)")
            }
        }

    }
    
    func sendColor(_ colorName : String) {
        NSLog("%@", "sendColor: \(colorName)")
        
        if session.connectedPeers.count > 0 {
            let error : NSError?
            do {
                try self.session.send(colorName.data(using: String.Encoding.utf8, allowLossyConversion: false)!, toPeers: session.connectedPeers, with: MCSessionSendDataMode.reliable)
            } catch let error1 as NSError {
                error = error1
                NSLog("%@", "\(String(describing: error))")
            }
        }
        
    }
    
    

    deinit {
        self.serviceAdvertiser.stopAdvertisingPeer()
        self.serviceBrowser.stopBrowsingForPeers()
    }

}

extension ColorServiceManager : MCNearbyServiceAdvertiserDelegate {

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        NSLog("%@", "didNotStartAdvertisingPeer: \(error)")
    }

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        NSLog("%@", "didReceiveInvitationFromPeer \(peerID)")
        invitationHandler(true, self.session)
    }

}

extension ColorServiceManager : MCNearbyServiceBrowserDelegate {

    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        NSLog("%@", "didNotStartBrowsingForPeers: \(error)")
    }

    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        NSLog("%@", "foundPeer: \(peerID)")
        NSLog("%@", "invitePeer: \(peerID)")
        browser.invitePeer(peerID, to: self.session, withContext: nil, timeout: 10)
    }

    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        NSLog("%@", "lostPeer: \(peerID)")
    }
    
}

extension ColorServiceManager : MCSessionDelegate {

    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        //NSLog("%@", "peer \(peerID) didChangeState: \(state.stringValue())")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices: session.connectedPeers.map({$0.displayName}), peerCount: session.connectedPeers.count)
        //   self.delegate?.connectedDevicesChanged(self, connectedDevices: session.connectedPeers.map({$0.displayName}), myPlayerID: session.myPlayerID.map({$0.myPlayerID}), peerCount: session.connectedPeers.count)
        NSLog("%@", "peerList: \(session.connectedPeers)")
        
        if session.connectedPeers.count > 0 {
            playerTwo = session.connectedPeers[0].displayName
        }
        if session.connectedPeers.count > 1 {
            playerThree = session.connectedPeers[1].displayName
        }
        if session.connectedPeers.count > 2 {
            playerFour = session.connectedPeers[2].displayName
        }
    }
    
    
//    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
//        NSLog("%@", "peer \(peerID) didChangeState: \(state)")
//        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices:
//          //  session.connectedPeers.map{$0.displayName}), peerCount: session.connectedPeers.count)
//        self.delegate?.connectedDevicesChanged(self, connectedDevices: session.connectedPeers.map({$0.displayName}), peerCount: session.connectedPeers.count)
//    }

//    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
//        NSLog("%@", "didReceiveData: \(data)")
//        let str = String(data: data, encoding: .utf8)!
//        self.delegate?.colorChanged(manager: self, colorString: str)
//    }

    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "recievedFromPeer: \(peerID.displayName)")
        NSLog("%@", "didReceiveData: \(data.count) bytes")
        NSLog("%@", "connectedDevices: \(session.connectedPeers.count)")
        NSLog("%@", "playerTwo-ifStatement: \(playerTwo)")
        let str = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        self.delegate?.colorChanged(manager: self, colorString: str, senderPeerID: peerID.displayName)
        
//        if gameStatus < 1 {
//
//            gameStatus = 1
//            self.sendColor(myPlayerID)
//            self.managePeerNameList(peerID.displayName)
//            NSLog("%@", "gameStatus: \(gameStatus)")
//
//        }
    }
    
    
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveStream")
    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        NSLog("%@", "didStartReceivingResourceWithName")
    }

    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        NSLog("%@", "didFinishReceivingResourceWithName")
    }

}
