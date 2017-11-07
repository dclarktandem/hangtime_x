//
//  GameModel.swift
//  Hangtime X
//
//  Created by Luke Whited ;) on 11/6/17.
//  Copyright © 2017 Example. All rights reserved.
//

import Foundation
import UIKit

var devicePlayerNum = Int()


class GameModel
{
    
    enum initialSet {
        case p1(Double)
        case p2(Double)
        
    }
    
    
    var gamerList = [initialSet]()
    // let myDeviceName = [UIDevice currentDevice].name;
    
    
    func setGamerList(connectedDevices: [String]) -> Int{
        
        NSLog("Got to setGamerList")
        NSLog("Gamer List Players Available: \(connectedDevices)")
        
        
        
        let systemName = UIDevice.current.name
        NSLog("Name\(systemName)")
        
        let myNameCount = systemName.characters.count
        
        NSLog("Count of systemName: \(myNameCount)")
        
        
        let myNameValue: Int = nameValue(workingName: systemName)
        
        NSLog("nameValue: \(myNameValue)")
        
        
        let basicPlayerArray = assembleArray(myPlayerList: connectedDevices,thisDevice: systemName)
        
        NSLog("basicPlayerArray: \(basicPlayerArray)")
        
        let sortedPlayerValueArray: [Int]
        
        sortedPlayerValueArray = sortList(workingArray: basicPlayerArray)
        
        NSLog("sortedPlayerValueArray: \(sortedPlayerValueArray)")
        
        let myAssignedPlayerNum: Int = assignMyPlayerNumber(localPlayerValueArray: sortedPlayerValueArray, localNameValue: myNameValue)
        
        NSLog("myAssignedPlayerNum: \(myAssignedPlayerNum)")
        
        return myAssignedPlayerNum
        
    }
    
    func assignMyPlayerNumber(localPlayerValueArray: [Int], localNameValue: Int) -> Int{
        
        var myInitialValue: Int = 0
        
        
        if localPlayerValueArray.count > 1 {
            
            myInitialValue = (localPlayerValueArray.index(of: localNameValue))! + 1
            
        } else {
            
            myInitialValue = 0
            
        }
        
        return myInitialValue
        
    }
    
    
    
    
    
    func assembleArray(myPlayerList: [String], thisDevice: String) -> [String] {
        
        var unsortedPlayerArray = myPlayerList
        
        unsortedPlayerArray.append(thisDevice)
        
        
        return unsortedPlayerArray
        
        
    }
    
    
    
    func sortList(workingArray: [String]) -> [Int]{
        
        var workingValueArray = [Int]()
        
        for j in 0 ... workingArray.count - 1 {
            
            workingValueArray.append(nameValue(workingName: workingArray[j]))
            
        }
        
        workingValueArray.sort()
        
        
        return workingValueArray
    }
    
    
    
    func nameValue(workingName: String) -> Int {
        
        // let localCount = workingName.characters.count
        
        var totalVal = 0
        var ch: Character
        
        for i in 1 ... (workingName.characters.count - 1) {
            
            let index = workingName.index(workingName.startIndex, offsetBy: i)
            
            ch = workingName[index]
            
            let s = String(ch).unicodeScalars
            let myVal: Int = Int(s[s.startIndex].value)
            
            totalVal += myVal
            
        }
        
        
        
        
        return totalVal
    }
    
    
    
    //    func advanceQuestion(deviceNum: Int, currentQNum: Int) -> String {
    //
    //    case deviceNum
    
    //  1:
    //   case
    
    //
    //   }
    
    
}
