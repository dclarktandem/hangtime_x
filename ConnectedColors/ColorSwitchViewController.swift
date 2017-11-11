import UIKit
import AVFoundation
//var myGlobalPlayerNum = Int()


class ColorSwitchViewController: UIViewController {
    
    var openingSoundEffect: AVAudioPlayer!
    var hornSoundEffect: AVAudioPlayer!
    var brain = GameModel()
    var myGlobalPlayerNum = Int()
    var numPlayers = 0

    @IBOutlet weak var connectionsLabel: UILabel!

    let colorService = ColorServiceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        colorService.delegate = self
        
        self.playerDownStackView.alpha = 0.0
       // self.sil_down_white.alpha = 0.0
      //  self.sil_down_red.alpha = 0.0
       // self.sil_down_blue.alpha = 0.0
      //  self.sil_down_silver.alpha = 0.0
        
        // Hi Mr. Clark
        // Hi Luke
        
        self.sil_up_white.alpha = 0.0
        self.sil_up_red.alpha = 0.0
        self.sil_up_blue.alpha = 0.0
        self.sil_up_silver.alpha = 0.0
        self.lockerBall.alpha = 0.0
        
        
    }

    @IBAction func redTapped() {
        self.change(color: .red)
        colorService.send(colorName: "red")
        
        let path = Bundle.main.path(forResource: "NFL Opening Final.mp3", ofType:nil)!
        let openingUrl = URL(fileURLWithPath: path)
        
        
        do {
            let sound = try AVAudioPlayer(contentsOf: openingUrl)
            openingSoundEffect = sound
            sound.play()
        } catch {
            // couldn't load file :(
        }
        
        
        
    }
    
    @IBOutlet weak var sil_down_white: UIImageView!
    
    @IBOutlet weak var sil_down_red: UIImageView!
    
    @IBOutlet weak var sil_down_blue: UIImageView!
    
    @IBOutlet weak var sil_down_silver: UIImageView!
    
    @IBOutlet weak var sil_up_white: UIImageView!
    
    @IBOutlet weak var sil_up_red: UIImageView!
    
    @IBOutlet weak var sil_up_blue: UIImageView!
    
    
    @IBOutlet weak var sil_up_silver: UIImageView!
    
    
    @IBOutlet weak var playerDownStackView: UIStackView!
    
    
    @IBOutlet weak var PlayerNum_Label: UILabel!
    
    @IBOutlet weak var locker_image: UIImageView!
    
    @IBOutlet weak var lockerBall: UIImageView!
    
    @IBAction func lockerBall_Button(_ sender: Any) {
        
        switch myGlobalPlayerNum {
        
        case 1:
            colorService.sendColor("dark_white")
            self.sil_down_white.alpha = 1.0
            self.sil_up_white.alpha = 0.0
        case 2:
            colorService.sendColor("dark_red")
            self.sil_down_red.alpha = 1.0
            self.sil_up_red.alpha = 0.0
        case 3:
            colorService.sendColor("dark_blue")
            self.sil_down_blue.alpha = 1.0
            self.sil_up_blue.alpha = 0.0
        case 4:
            colorService.sendColor("dark_silver")
            self.sil_down_silver.alpha = 1.0
            self.sil_up_silver.alpha = 0.0
        default:
            print("No value for myGlobalPlayerNum")
         }
    }
 
    @IBAction func ballTap_released(_ sender: Any) {
        
        switch myGlobalPlayerNum {
            
        case 1:
            colorService.sendColor("white")
            self.sil_down_white.alpha = 0.0
            self.sil_up_white.alpha = 1.0
        case 2:
            colorService.sendColor("red")
            self.sil_down_red.alpha = 0.0
            self.sil_up_red.alpha = 1.0
        case 3:
            colorService.sendColor("blue")
            self.sil_down_blue.alpha = 0.0
            self.sil_up_blue.alpha = 1.0
        case 4:
            colorService.sendColor("silver")
            self.sil_down_silver.alpha = 0.0
            self.sil_up_silver.alpha = 1.0
        default:
            print("No value for myGlobalPlayerNum")
        }
        
        
    }
    

    
    @IBAction func ballTapped_heldDown(_ sender: Any) {
        
        switch myGlobalPlayerNum {
            
        case 1:
          //  brain.colorService.sendColor("white")
            self.sil_down_white.alpha = 0.0
            self.sil_up_white.alpha = 1.0
            startOne = true
          //  checkPlayerStart()
        case 2:
          //  brain.colorService.sendColor("red")
            self.sil_down_red.alpha = 0.0
            self.sil_up_red.alpha = 1.0
            startTwo = true
           // checkPlayerStart()
        case 3:
          //  brain.colorService.sendColor("blue")
            self.sil_down_blue.alpha = 0.0
            self.sil_up_blue.alpha = 1.0
            startThree = true
           // checkPlayerStart()
        case 4:
          //  brain.colorService.sendColor("gray")
            self.sil_down_silver.alpha = 0.0
            self.sil_up_silver.alpha = 1.0
            startFour = true
           // checkPlayerStart()
        default:
            NSLog("%@", "******** Unknown Player Num: \(myGlobalPlayerNum)")
          //  brain.colorService.sendColor("white")
//            player1_down.isHidden = true
//            player1_up.isHidden = false
            startOne = true
          //  checkPlayerStart()
            
        }
        
    }
    
    
    
    
    @IBAction func yellowTapped() {
        self.change(color: .yellow)
        colorService.send(colorName: "yellow")
    }

    func change(color : UIColor) {
        UIView.animate(withDuration: 0.2) {
            self.view.backgroundColor = color
        }
    }
    
    func setUpLockerView() {
        
        print("Got to Setup Lockerview")
        
        UIView.animate(withDuration: 0.5, animations: {
            
        self.sil_down_white.alpha = 1.0
        self.sil_down_red.alpha = 1.0
        self.sil_down_blue.alpha = 1.0
        self.sil_down_silver.alpha = 0.0
        })
        
            switch self.numPlayers {

            case 0:
                self.sil_down_white.alpha = 0.0
                self.sil_down_red.alpha = 0.0
                self.sil_down_blue.alpha = 0.0
                self.sil_down_silver.alpha = 0.0
            case 1:
                self.sil_down_white.alpha = 1.0
                self.sil_down_red.alpha = 0.0
                self.sil_down_blue.alpha = 0.0
                self.sil_down_silver.alpha = 0.0
            case 2:
                self.sil_down_white.alpha = 1.0
                self.sil_down_red.alpha = 1.0
                self.sil_down_blue.alpha = 0.0
                self.sil_down_silver.alpha = 0.0
            case 3:
                self.sil_down_white.alpha = 1.0
                self.sil_down_red.alpha = 1.0
                self.sil_down_blue.alpha = 1.0
                self.sil_down_silver.alpha = 0.0
            case 4:
                self.sil_down_white.alpha = 1.0
                self.sil_down_red.alpha = 1.0
                self.sil_down_blue.alpha = 1.0
                self.sil_down_silver.alpha = 1.0
            default:
               print("Unknown Number of Players")
            }
    
    
    //self.sil_up_white.alpha = 0.0
        //self.sil_up_red.alpha = 0.0
        //self.sil_up_blue.alpha = 0.0
        //self.sil_up_silver.alpha = 0.0
        //self.lockerBall.alpha = 0.0
        
        
    }
    
    func updatePlayerNumDisplay(){
        self.PlayerNum_Label.text = String(myGlobalPlayerNum)
    }
   
    @IBOutlet weak var football: UIImageView!
    
    
    @IBAction func ball_button(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
        let hornUrl = URL(fileURLWithPath: path)
        
        print("Ball Button Tapped")
        do {
            let sound = try AVAudioPlayer(contentsOf: hornUrl)
            hornSoundEffect = sound
            sound.play()
            
        
            
        } catch {
            // couldn't load file :(
        }
        

        
        UIView.animate(withDuration: 0.5, animations: {self.football.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
        })
        
        UIView.animate(withDuration: 0.5, animations: {self.football.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)},
                       completion:{(Bool)  in
                        self.locker_image.alpha = 0.0 //for zero opacity
                        self.locker_image.isHidden = false
                        
                        UIView.animate(withDuration: 0.5, animations: {
                            self.locker_image.alpha = 1.0})
                        UIView.animate(withDuration: 0.5, animations: {
                            self.playerDownStackView.alpha = 1.0})
                        UIView.animate(withDuration: 0.5, animations: {
                            self.lockerBall.alpha = 1.0})
                        

                        
     })
                        
          // setUpLockerView()
    }
    
    func checkPlayerStart() {
        
        if numPlayers == 2 && startOne == true && startTwo == true {
            
            switch myGlobalPlayerNum {
                
            case 1:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_1_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_1_View") as! GameViewController
//                self.navigationController?.pushViewController(Player_1_View, animated: true)
                
                
                
            case 2:
              NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_2_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_2_View") as! GameViewController_Two
//                self.navigationController?.pushViewController(Player_2_View, animated: true)
                
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
            
        }
        if numPlayers == 3 && startOne == true && startTwo == true && startThree == true {
            switch myGlobalPlayerNum {
                
            case 1:
              NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_1_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_1_View") as! GameViewController
//                self.navigationController?.pushViewController(Player_1_View, animated: true)
                
                
            case 2:
             NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_2_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_2_View") as! GameViewController_Two
//                self.navigationController?.pushViewController(Player_2_View, animated: true)
                
                
            case 3:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_3_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_3_View") as! GameViewController_Three
//                self.navigationController?.pushViewController(Player_3_View, animated: true)
                
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        if numPlayers == 4 && startOne == true && startTwo == true && startThree == true && startFour == true {
            switch myGlobalPlayerNum {
                
            case 1:
          NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_1_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_1_View") as! GameViewController
//                self.navigationController?.pushViewController(Player_1_View, animated: true)
                
                
            case 2:
        NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_2_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_2_View") as! GameViewController_Two
//                self.navigationController?.pushViewController(Player_2_View, animated: true)
                
                
            case 3:
        NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_3_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_3_View") as! GameViewController_Three
//                self.navigationController?.pushViewController(Player_3_View, animated: true)
                
                
            case 4:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
//                let Player_4_View = self.storyboard?.instantiateViewController(withIdentifier: "Player_4_View") as! GameViewController_Four
//                self.navigationController?.pushViewController(Player_4_View, animated: true)
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        
    }
    
    
    
    }
        

    


extension ColorSwitchViewController : ColorServiceManagerDelegate {

    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String], peerCount: Int) {
//        OperationQueue.main.addOperation {
//            self.connectionsLabel.text = "Connections: \(connectedDevices)"
//        }
        let myActivePlayerNumber = self.brain.setGamerList(connectedDevices: connectedDevices)
        myGlobalPlayerNum = myActivePlayerNumber
        print("got to connecteDevicesChanged")
        print("MyGlobalPlayerNumber is: \(myGlobalPlayerNum)")
     OperationQueue.main.addOperation {
           self.PlayerNum_Label.text = String(self.myGlobalPlayerNum)
        self.numPlayers = peerCount + 1
        print("numPlayers: \(self.numPlayers)")
        self.setUpLockerView()
      }
    }

    
    func colorChanged(manager: ColorServiceManager, colorString: String, senderPeerID: String) {
        OperationQueue.main.addOperation {
            switch colorString {
            case "white":
                self.sil_down_white.alpha = 0.0
                self.sil_up_white.alpha = 1.0
            case "red":
                self.sil_down_red.alpha = 0.0
                self.sil_up_red.alpha = 1.0
            case "blue":
                self.sil_down_blue.alpha = 0.0
                self.sil_up_blue.alpha = 1.0
            case "silver":
                self.sil_down_silver.alpha = 0.0
                self.sil_up_silver.alpha = 1.0
            case "dark_white":
                self.sil_down_white.alpha = 1.0
                self.sil_up_white.alpha = 0.0
            case "dark_red":
                self.sil_down_red.alpha = 1.0
                self.sil_up_red.alpha = 0.0
            case "dark_blue":
                self.sil_down_blue.alpha = 1.0
                self.sil_up_blue.alpha = 0.0
            case "dark_silver":
                self.sil_down_silver.alpha = 1.0
                self.sil_up_silver.alpha = 0.0
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }

}
