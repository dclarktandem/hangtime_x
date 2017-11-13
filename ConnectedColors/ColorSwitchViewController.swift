import UIKit
import AVFoundation
//var myGlobalPlayerNum = Int()


class ColorSwitchViewController: UIViewController {
    
    var openingSoundEffect: AVAudioPlayer!
    var hornSoundEffect: AVAudioPlayer!
    var brain = GameModel()
    var myGlobalPlayerNum = Int()
    var numPlayers = 0

    @IBOutlet weak var connectionsLabel: UILabel! // Displays connections

    let colorService = ColorServiceManager() // creates peer connection class

    override func viewDidLoad() { // loads everyting prior to first display
        super.viewDidLoad()
        colorService.delegate = self
        
        self.playerDownStackView.alpha = 0.0 // L - What does this do

        
        // L - this block hides all players on the launch screen?
        self.turfScreen.alpha = 0.0
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
    
    @IBOutlet weak var turfScreen: UIImageView!
    
    @IBOutlet weak var panelBkground_1_1: UIView!
    
    
    
    @IBAction func lockerBall_Button(_ sender: Any) {
        
        switch myGlobalPlayerNum {
        
        case 1:
            colorService.sendColor("dark_white")
            self.sil_down_white.alpha = 1.0
            self.sil_up_white.alpha = 0.0
            startOne = false
        case 2:
            colorService.sendColor("dark_red")
            self.sil_down_red.alpha = 1.0
            self.sil_up_red.alpha = 0.0
            startTwo = false
        case 3:
            colorService.sendColor("dark_blue")
            self.sil_down_blue.alpha = 1.0
            self.sil_up_blue.alpha = 0.0
            startThree = false
        case 4:
            colorService.sendColor("dark_silver")
            self.sil_down_silver.alpha = 1.0
            self.sil_up_silver.alpha = 0.0
            startThree = false
        default:
            print("No value for myGlobalPlayerNum")
         }
    }
 
    @IBAction func ballTap_released(_ sender: Any) {
        
        switch myGlobalPlayerNum {
            
        case 1:
            startOne = true
            colorService.sendColor("white")
            self.sil_down_white.alpha = 0.0
            self.sil_up_white.alpha = 1.0
            checkPlayerStart()
        case 2:
            startTwo = true
            colorService.sendColor("red")
            self.sil_down_red.alpha = 0.0
            self.sil_up_red.alpha = 1.0
            checkPlayerStart()
        case 3:
            startThree = true
            colorService.sendColor("blue")
            self.sil_down_blue.alpha = 0.0
            self.sil_up_blue.alpha = 1.0
            checkPlayerStart()
        case 4:
            startFour = true
            colorService.sendColor("silver")
            self.sil_down_silver.alpha = 0.0
            self.sil_up_silver.alpha = 1.0
            checkPlayerStart()
        default:
            print("No value for myGlobalPlayerNum")
        }
        
        
    }
    

    
    @IBAction func ballTapped_heldDown(_ sender: Any) {
        
        print("Got ballTapped_heldDown")
        
        switch myGlobalPlayerNum {
            
        case 1:
         
            self.sil_down_white.alpha = 0.0
            self.sil_up_white.alpha = 1.0
            startOne = true
            checkPlayerStart()
        case 2:
          
            self.sil_down_red.alpha = 0.0
            self.sil_up_red.alpha = 1.0
            startTwo = true
            checkPlayerStart()
        case 3:
         
            self.sil_down_blue.alpha = 0.0
            self.sil_up_blue.alpha = 1.0
            startThree = true
            checkPlayerStart()
        case 4:
          
            self.sil_down_silver.alpha = 0.0
            self.sil_up_silver.alpha = 1.0
            startFour = true
            checkPlayerStart()
        default:
            NSLog("%@", "******** Unknown Player Num: \(myGlobalPlayerNum)")
       
            
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
        
        
        print("Got to checkPlayerStart")
        NSLog("%@", "numPlayers: \(numPlayers)")
        print("myGlobalPlayerNum: \(myGlobalPlayerNum)")
        print("startOne: \(startOne)")
        print("startTwo: \(startTwo)")
        
        
        if numPlayers == 2 && startOne == true && startTwo == true {
            
            switch myGlobalPlayerNum {
                
            case 1:
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
             
        
                
            case 2:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
            
        }
        if numPlayers == 3 && startOne == true && startTwo == true && startThree == true {
            switch myGlobalPlayerNum {
                
            case 1:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
            case 2:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
            case 3:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        if numPlayers == 4 && startOne == true && startTwo == true && startThree == true && startFour == true {
            switch myGlobalPlayerNum {
                
            case 1:
          

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
            case 2:
        

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
            case 3:
        
        
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
            case 4:
                

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        
    }
    
    func setUpGenericGameScreen(){
        
        
        
    }
    
    
    
    func setUpGameScreenOne (){
        
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
                startOne = true
                self.sil_down_white.alpha = 0.0
                self.sil_up_white.alpha = 1.0
                self.checkPlayerStart()
            case "red":
                startTwo = true
                self.sil_down_red.alpha = 0.0
                self.sil_up_red.alpha = 1.0
                self.checkPlayerStart()
            case "blue":
                startThree = true
                self.sil_down_blue.alpha = 0.0
                self.sil_up_blue.alpha = 1.0
                self.checkPlayerStart()
            case "silver":
                startFour = true
                self.sil_down_silver.alpha = 0.0
                self.sil_up_silver.alpha = 1.0
                self.checkPlayerStart()
            case "dark_white":
                startOne = false
                self.sil_down_white.alpha = 1.0
                self.sil_up_white.alpha = 0.0
               
            case "dark_red":
                startTwo = false
                self.sil_down_red.alpha = 1.0
                self.sil_up_red.alpha = 0.0
                
            case "dark_blue":
                startThree = false
                self.sil_down_blue.alpha = 1.0
                self.sil_up_blue.alpha = 0.0
               
            case "dark_silver":
                startFour = false
                self.sil_down_silver.alpha = 1.0
                self.sil_up_silver.alpha = 0.0
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }

}
