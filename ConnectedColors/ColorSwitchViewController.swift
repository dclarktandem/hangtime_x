import UIKit
import AVFoundation
//var myGlobalPlayerNum = Int()

var passTrigger = 0
var rushingTrigger = 0
var promptSwitch_1 = 1

var current_1_prompt = "prompt_1_1"
var current_2_prompt = "prompt_2_1"
var current_3_prompt = "prompt_3_1"
var current_4_prompt = "prompt_4_1"

var P1_1_duration = 0
var P1_2_duration = 0
var P1_3_duration = 0
var P1_4_duration = 0
var P1_5_duration = 0
var P1_6_duration = 0

var P2_1_duration = 0
var P2_2_duration = 0
var P2_3_duration = 0
var P2_4_duration = 0
var P2_5_duration = 0
var P2_6_duration = 0

var P3_1_duration = 0
var P3_2_duration = 0
var P3_3_duration = 0
var P3_4_duration = 0
var P3_5_duration = 0
var P3_6_duration = 0

var P4_1_duration = 0
var P4_2_duration = 0
var P4_3_duration = 0
var P4_4_duration = 0
var P4_5_duration = 0
var P4_6_duration = 0

var P1_1_startTime = 0
var P1_2_startTime = 0
var P1_3_startTime = 0
var P1_4_startTime = 0
var P1_5_startTime = 0
var P1_6_startTime = 0


var P2_2_startTime = 0
var P2_3_startTime = 0
var P2_4_startTime = 0
var P2_5_startTime = 0
var P2_6_startTime = 0


var P3_2_startTime = 0
var P3_3_startTime = 0
var P3_4_startTime = 0
var P3_5_startTime = 0
var P3_6_startTime = 0


var P4_2_startTime = 0
var P4_3_startTime = 0
var P4_4_startTime = 0
var P4_5_startTime = 0
var P4_6_startTime = 0

class ColorSwitchViewController: UIViewController {
    
    var openingSoundEffect: AVAudioPlayer!
    var hornSoundEffect: AVAudioPlayer!
    var brain = GameModel()
    var myGlobalPlayerNum = Int()
    var numPlayers = 0
    
    var currentCount = 40
    var timeValue_1 = 0
    var progressAmount = 0

    @IBOutlet weak var connectionsLabel: UILabel! // Displays connections

    let colorService = ColorServiceManager() // creates peer connection class

    override func viewDidLoad() { // loads everyting prior to first display
        super.viewDidLoad()
        //colorService.delegate = self as? ColorServiceManagerDelegate
        colorService.delegate = self
        clockDisplay.layer.borderWidth = 3.0
        clockDisplay.layer.borderColor = UIColor(hexString: "#00a334").cgColor
        clockDisplay.adjustsFontSizeToFitWidth = true
        clockDisplay.fitFontForSize()
        clockDisplay.padding = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 5)
        
        taskPanel.adjustsFontSizeToFitWidth = true
        taskPanel.fitFontForSize()
        
        self.playerDownStackView.alpha = 0.0 // L - What does this do

        
        // L - this block hides all players on the launch screen?
        self.turfScreen.alpha = 0.0
        self.sil_up_white.alpha = 0.0
        self.sil_up_red.alpha = 0.0
        self.sil_up_blue.alpha = 0.0
        self.sil_up_silver.alpha = 0.0
        self.lockerBall.alpha = 0.0
        
        panelBkground_1_1.alpha = 0.0
        panelBkground_2.alpha = 0.0
        panelBkground_3.alpha = 0.0
        panelBkground_4.alpha = 0.0
        panelBkground_5.alpha = 0.0
        panelBkground_6.alpha = 0.0
        
        clockDisplay.alpha = 0.0
        roundCountView.alpha = 0.0
        
        callText_1.alpha = 0.0
        callText_2.alpha = 0.0
        callText_3.alpha = 0.0
        callText_4.alpha = 0.0
        callText_5.alpha = 0.0
        callText_6.alpha = 0.0
        
        panelBkground_1_1.layer.cornerRadius = 10
        panelBkground_2.layer.cornerRadius = 10
        panelBkground_3.layer.cornerRadius = 10
        panelBkground_4.layer.cornerRadius = 10
        panelBkground_5.layer.cornerRadius = 10
        panelBkground_6.layer.cornerRadius = 10
       
        Timer.scheduledTimer(timeInterval: 0.001,
                             target: self,
                             selector: #selector(self.updateTime),
                             userInfo: nil,
                             repeats: true)
        
        
    }
    
    
    func updateTime(){
        
        
        timeValue_1 += 1
        
        if myGlobalPlayerNum == 1 {
            
            if timeValue_1 % 700 == 0 {
                
                if currentCount == 34 && promptSwitch_1  == 1 {changePrompt(whichPrompt: 2)}
                if currentCount == 28 && promptSwitch_1  == 2  {changePrompt(whichPrompt: 3)}
                if currentCount == 22 && promptSwitch_1  == 3  {changePrompt(whichPrompt: 4)}
                if currentCount == 14 && promptSwitch_1  == 4  {changePrompt(whichPrompt: 5)}
                if currentCount == 7 && promptSwitch_1  == 5  {changePrompt(whichPrompt: 6)}
                
                currentCount -= 1
               // sendTime(currentCount: currentCount)
                colorService.sendColor("updateClockMSG")
                clockDisplay.text = String(currentCount)
            }
        }
        
     }
    
    func sendTime(currentCount: Int){
    
     colorService.sendColor(String(currentCount))
        
    }
    
    func updateClock(){
      
    currentCount -= 1
        clockDisplay.text = String(currentCount)
        
    }
    
    
    func playCountDown(){
        roundCountView.loadGif(name: "round_timer_2")
        
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
    
    @IBOutlet weak var clockDisplay: UILabel!
    
    @IBAction func panel_1_Button(_ sender: Any) {
        
        
    }
    
    @IBAction func panel_2_Button(_ sender: Any) {
        
    }
    @IBAction func panel_3_Button(_ sender: Any) {
        
    }
    @IBAction func panel_4_Button(_ sender: Any) {
        
    }
    
    @IBAction func panel_5_Button(_ sender: Any) {
        
    }
    
    @IBAction func panel_6_Button(_ sender: Any) {
        
    }
    
    
    @IBOutlet weak var panelBkground_1_1: UIView!
    @IBOutlet weak var panelBkground_2: UIView!
    @IBOutlet weak var panelBkground_3: UIView!
    @IBOutlet weak var panelBkground_4: UIView!
    @IBOutlet weak var panelBkground_5: UIView!
    @IBOutlet weak var panelBkground_6: UIView!
    
   
    @IBOutlet weak var callText_1: UILabel!
    @IBOutlet weak var callText_2: UILabel!
    @IBOutlet weak var callText_3: UILabel!
    @IBOutlet weak var callText_4: UILabel!
    @IBOutlet weak var callText_5: UILabel!
    @IBOutlet weak var callText_6: UILabel!
    
    @IBOutlet weak var taskPanel: UILabel!
    
    @IBOutlet weak var roundCountView: UIImageView!
    
    
    @IBAction func lockerBall_Button(_ sender: Any) {
        
        switch myGlobalPlayerNum {
        //L - Do each of these colors represent players on the selection screen?
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
        //L - What is IBAction?
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
    
    
    func changePrompt(whichPrompt: Int){
        
        
        switch whichPrompt {
        case 2:
            self.taskPanel.text = String("Screen Pass Behind Line")
            promptSwitch_1 = 2
        case 3:
            self.taskPanel.text = String("Call Audible: Hail Mary")
            promptSwitch_1 = 3
        case 4:
            self.taskPanel.text = String("Spike Ball in End Zone")
            promptSwitch_1 = 4
        case 5:
            self.taskPanel.text = String("Run Block to 3 Yards")
            promptSwitch_1 = 5
        case 6:
            self.taskPanel.text = String("Protect Pocket")


        default:
            self.taskPanel.text = String("Default Called")
        }
        
        
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
            // couldn't load file D:
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
             setUpGameScreen_1_1()
        
                
            case 2:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_2_1()
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
            
        }
        if numPlayers == 3 && startOne == true && startTwo == true && startThree == true {
            switch myGlobalPlayerNum {
                
            case 1:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_1_1()
                
            case 2:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_2_1()
                
            case 3:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_3_1()
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        if numPlayers == 4 && startOne == true && startTwo == true && startThree == true && startFour == true {
            switch myGlobalPlayerNum {
                
            case 1:
          

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_1_1()
                
            case 2:
        

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_2_1()
                
            case 3:
        
        
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_3_1()
                
            case 4:
                

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_4_1()
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        
    }
    
    
    
    
    func setUpGameScreenElements(){
        
        panelBkground_1_1.alpha = 1.0
        panelBkground_2.alpha = 1.0
        panelBkground_3.alpha = 1.0
        panelBkground_4.alpha = 1.0
        panelBkground_5.alpha = 1.0
        panelBkground_6.alpha = 1.0
        
        callText_1.alpha = 1.0
        callText_2.alpha = 1.0
        callText_3.alpha = 1.0
        callText_4.alpha = 1.0
        callText_5.alpha = 1.0
        callText_6.alpha = 1.0
        
        currentCount = 40
        clockDisplay.alpha = 1.0
        roundCountView.alpha = 1.0
        playCountDown()
        
    }
    
    
    
    func setUpGameScreen_1_1 (){
       
        setUpGameScreenElements()
        
        taskPanel.text = "Set Crowd Noise to Insane"
        
        self.callText_1.text = "Drag Route In"
        self.callText_2.text = "Off Tackle Outside"
        self.callText_3.text = "Pass Block Step Back"
        self.callText_4.text = "Forward Pass"
        self.callText_5.text = "Flea Flicker to Running Back"
        self.callText_6.text = "Test - Rushing Yards to 10"
        
        }
    
    func setUpGameScreen_2_1 (){
        
        setUpGameScreenElements()
        
        taskPanel.text = "Forward Pass 20 Yards"
        
        self.callText_1.text = "Offensive Gaurds Lineup"
        self.callText_2.text = "Wide Receiver in Slot Position"
        self.callText_3.text = "Set Crowd Noise to Insane"
        self.callText_4.text = "Run Block"
        self.callText_5.text = "Play Action Fake"
        self.callText_6.text = "Hook and Ladder Hook"
        
    }
    
    func setUpGameScreen_3_1 (){
        
        setUpGameScreenElements()
        

        
        self.callText_1.text = "Upback"
        self.callText_2.text = "Water Boy to Empty"
        self.callText_3.text = "Protect Pocket"
        self.callText_4.text = "Quarterback Sneak"
        self.callText_5.text = "Screen Pass Behind Line"
        self.callText_6.text = "Slam"
        
    }
    
    func setUpGameScreen_4_1 (){
        
        setUpGameScreenElements()
        

        
        
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
            case "updateClockMSG":
                self.updateClock()
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

                
                //This block checks valid answers during the game
                
                
            case "1_1":
                if current_2_prompt == "prompt_2_3" {
                    
                 //   let P2_3_endTime = NSDate()
                    
//                    print("P2_3_endTime :", P2_3_endTime.timeIntervalSinceReferenceDate)
                    
                    P2_3_duration = 0
                    
                    print("P2_3_duration :", P2_3_duration)
                    
                    current_2_prompt = "prompt_2_4"
                    P2_4_startTime = 0
                    
                    
//                    if self.myGlobalPlayerNum == 1 {
//                        GameViewController().playCountDown()
//                    }
                    
                }
                
            case "1_2":
                if current_3_prompt == "prompt_3_5" {
                    
               //     let P3_5_endTime = NSDate()
                    
//                    print("P3_5_endTime :", P3_5_endTime.timeIntervalSinceReferenceDate)
                    
                    P3_5_duration = 0
                    
                    print("P3_5_duration :", P3_5_duration)
                    
                    current_3_prompt = "prompt_3_6"
                    
                }
                
            case "1_3":
                if current_4_prompt == "prompt_4_3" {
                    
               //     let P4_3_endTime = NSDate()
                    
//                    print("P4_3_endTime :", P4_3_endTime.timeIntervalSinceReferenceDate)
                    
                    P4_3_duration = 0
                    
                    print("P4_3_duration :", P1_3_duration)
                    
                    current_4_prompt = "prompt_4_4"
                    
                }
                
            case "1_4":
                
                print("Got color 1_4.  - Locker view - current_2_prompt is:", current_2_prompt)
                
                if current_2_prompt == "prompt_2_1" {
                    
                //    let P2_1_endTime = 0
                    
//                    print("P2_1_endTime :", P2_1_endTime.timeIntervalSinceReferenceDate)
//                    print("P2_1_startTime :", P2_1_startTime.timeIntervalSinceReferenceDate)
                    
                    // let timeInterval: Double = end.timeIntervalSinceDate(start);
                    
//                    let P2_1_duration: Double = (round(100*(P2_1_endTime.timeIntervalSince(P2_1_startTime as Date)))/100);
                    
                    //     P2_1_duration = (round(100*(P2_1_endTime.timeIntervalSinceReferenceDate - P2_1_startTime.timeIntervalSinceReferenceDate))/100)
                    
                    print("P2_1_duration :", P2_1_duration)
                    
                    current_2_prompt = "prompt_2_2"
                    
                    //   GameViewController_Two().playCountDown()
                    
                    
                    print("myGlobalPlayerNum  :", self.myGlobalPlayerNum )
                    
                    if self.myGlobalPlayerNum == 2 {
                        
                        //GameViewController_Two().playCountDown()
                        
                        //  GameViewController_Two().advanceTwo()
                        print ("LVC : I tried to implement it")
                        
                        // GameModel().callAdvance2()
                    }
                    
                    
                    // **** GameViewController_Two().advanceOne()
                    
                }
                
            case "1_5":
                if current_1_prompt == "prompt_2_4" {
                    
               //     let P2_4_endTime = NSDate()
                    
//                    print("P2_4_endTime :", P2_4_endTime.timeIntervalSinceReferenceDate)
                    
                    P2_4_duration = 0
                    
                    print("P2_4_duration :", P2_4_duration)
                    
                    current_2_prompt = "prompt_2_5"
                    
                }
                
            case "1_6":
                if current_3_prompt == "prompt_3_3" {
                    
               //     let P3_3_endTime = NSDate()
                    
//                    print("P3_3_endTime :", P3_3_endTime.timeIntervalSinceReferenceDate)
                    
                    P3_3_duration = 0
                    
                    print("P3_3_duration :", P3_3_duration)
                    
                    current_3_prompt = "prompt_3_4"
                    
                }
                
                //Player 2 prompt checks
                
            case "2_1":
                if current_1_prompt == "prompt_1_4" {
                    
              //      let P1_4_endTime = NSDate()
                    
//                    print("P1_4_endTime :", P1_4_endTime.timeIntervalSinceReferenceDate)
                    
                    P1_4_duration = 0
                    
                    print("P1_4_duration :", P1_4_duration)
                    
                    current_1_prompt = "prompt_1_5"
                    P1_5_startTime = 0
                }
                
            case "2_2":
                if current_3_prompt == "prompt_3_6" {
                    
               //     let P3_6_endTime = NSDate()
                    
//                    print("P3_6_endTime :", P3_6_endTime.timeIntervalSinceReferenceDate)
                    
                    P3_6_duration = 0
                    
                    print("P3_6_duration :", P3_6_duration)
                    
                    current_3_prompt = "Three Done"
                    
                }
                
            case "2_3":
                
                print("Got color 2_3. - LockerView -  current_1_prompt is:", current_1_prompt)
                
                
                if current_1_prompt == "prompt_1_1" {
                    
                //    let P1_1_endTime = NSDate()
                    
//                    print("P1_1_endTime :", P1_1_endTime.timeIntervalSinceReferenceDate)
//                    print("P2_1_startTime :", P1_1_startTime.timeIntervalSinceReferenceDate)
                    
                    // let timeInterval: Double = end.timeIntervalSinceDate(start);
                    

                    
                    
                    
                    //                        P1_1_duration = (round(100*(P1_1_endTime.timeIntervalSinceReferenceDate - P1_1_startTime.timeIntervalSinceReferenceDate))/100)
                    
                    
                    print("P1_1_duration :", P1_1_duration)
                    
                    
                    print("myGlobalPlayerNum  :", self.myGlobalPlayerNum )
                    
                    if self.myGlobalPlayerNum == 2 {
                        
                        
//
                        // GameViewController().playCountDown()
                        
                        print("LVC : I got here prompt 1_1 *****")
                        //  gvc.advanceOne()
                        //GameModel().callAdvance()
                        
                    }
                    
                    
                    //current_1_prompt = "prompt_1_2"
                    
                    
                    
                    
                    
                }
                
            case "2_4":
                if current_4_prompt == "prompt_4_1" {
                    
              //     let P4_1_endTime = 0
                    
//                    print("P4_1_endTime :", P4_1_endTime.timeIntervalSinceReferenceDate)
                    
                    P4_1_duration = 0
                    
                    print("P4_1_duration :", P4_1_duration)
                    
                    current_4_prompt = "prompt_4_2"
                    
                }
                
            case "2_5":
                if current_1_prompt == "prompt_1_3" {
                    
               //    let P1_3_endTime = 0
                    
//                    print("P1_3_endTime :", P1_3_endTime.timeIntervalSinceReferenceDate)
                    
                    P1_3_duration = 0
                    
                    print("P1_3_duration :", P1_3_duration)
                    
                    current_1_prompt = "prompt_1_4"
                    
                }
                
            case "2_6":
                if current_3_prompt == "prompt_3_2" {
                    
                //    let P3_2_endTime = NSDate()
                    
//                    print("P3_2_endTime :", P3_2_endTime.timeIntervalSinceReferenceDate)
                    
                    P3_2_duration = 0
                    
                    print("P3_2_duration :", P3_2_duration)
                    
                    current_3_prompt = "prompt_3_3"
                    
                }
                
                //Player 3 prompt checks
                
            case "3_1":
                if current_4_prompt == "prompt_4_4" {
                    
                //    let P4_4_endTime = NSDate()
                    
//                    print("P4_4_endTime :", P4_4_endTime.timeIntervalSinceReferenceDate)
                    
                    P4_4_duration = 0
                    
                    print("P4_4_duration :", P4_4_duration)
                    
                    current_4_prompt = "prompt_4_5"
                    P4_5_startTime = 0
                }
                
            case "3_2":
                if current_1_prompt == "prompt_1_6" {
                    
                 //   let P1_6_endTime = NSDate()
                    
//                    print("P1_6_endTime :", P1_6_endTime.timeIntervalSinceReferenceDate)
                    
                    P1_6_duration = 0
                    
                    print("P1_6_duration :", P1_6_duration)
                    
                    current_1_prompt = "One Done"
                    
                }
                
            case "3_3":
                if current_2_prompt == "prompt_2_6" {
                    
                //    let P2_6_endTime = NSDate()
                    
//                    print("P2_6_endTime :", P2_6_endTime.timeIntervalSinceReferenceDate)
                    
                    P2_6_duration = 0
                    
                    print("P2_6_duration :", P2_6_duration)
                    
                    current_2_prompt = "Two Done"
                    
                }
                
            case "3_4":
                if current_1_prompt == "prompt_1_1" {
                    
                //    let P1_1_endTime = NSDate()
                    
//                    print("P1_1_endTime :", P1_1_endTime.timeIntervalSinceReferenceDate)
                    
                    P1_1_duration = 0
                    
                    print("P1_1_duration :", P1_1_duration)
                    
                    current_1_prompt = "prompt_1_2"
                    
                }
                
            case "3_5":
                if current_4_prompt == "prompt_4_5" {
                    
                //    let P4_5_endTime = NSDate()
                    
//                    print("P4_5_endTime :", P4_5_endTime.timeIntervalSinceReferenceDate)
                    
                    P4_5_duration = 0
                    
                    print("P4_5_duration :", P4_5_duration)
                    
                    current_4_prompt = "prompt_4_6"
                    
                }
                
            case "3_6":
                if current_1_prompt == "prompt_1_2" {
                    
                //    let P1_2_endTime = NSDate()
                    
//                    print("P1_2_endTime :", P1_2_endTime.timeIntervalSinceReferenceDate)
                    
                    P1_2_duration = 0
                    
                    print("P1_2_duration :", P1_2_duration)
                    
                    current_1_prompt = "prompt_1_3"
                    
                }
                
                //Player 4 prompt checks
                
            case "4_1":
                if current_2_prompt == "prompt_2_5" {
                    
               //     let P2_5_endTime = NSDate()
                    
//                    print("P2_5_endTime :", P2_5_endTime.timeIntervalSinceReferenceDate)
                    
                    P2_5_duration = 0
                    
                    print("P2_5_duration :", P2_5_duration)
                    
                    current_2_prompt = "prompt_2_6"
                    P2_6_startTime = 0
                }
                
                
            case "4_2":
                if current_2_prompt == "prompt_2_2" {
                    
               //     let P2_2_endTime = NSDate()
                    
//                    print("P2_2_endTime :", P2_2_endTime.timeIntervalSinceReferenceDate)
                    
                    P2_2_duration = 0
                    
                    print("P2_2_duration :", P2_2_duration)
                    
                    current_2_prompt = "prompt_2_3"
                    
                }
                
            case "4_3":
                if current_1_prompt == "prompt_1_5" {
                    
                  //  let P1_5_endTime = NSDate()
                    
//                    print("P1_5_endTime :", P1_5_endTime.timeIntervalSinceReferenceDate)
                    
                    P1_5_duration = 0
                    
                    print("P1_5_duration :", P1_5_duration)
                    
                    current_1_prompt = "prompt_1_6"
                    
                }
                
            case "4_4":
                if current_4_prompt == "prompt_4_4" {
                    
                   // let P4_4_endTime = NSDate()
                    
//                    print("P4_4_endTime :", P4_4_endTime.timeIntervalSinceReferenceDate)
                    
                    P4_4_duration = 0
                    
                    print("P4_3_duration :", P4_4_duration)
                    
                    current_4_prompt = "prompt_4_5"
                    
                }
                
            case "4_5":
                if current_2_prompt == "prompt_2_1" {
                    
                  //  let P2_1_endTime = NSDate()
                    
//                    print("P2_1_endTime :", P2_1_endTime.timeIntervalSinceReferenceDate)
                    
                    P2_1_duration = 0
                    
                    print("P2_1_duration :", P2_1_duration)
                    
                    current_2_prompt = "prompt_2_2"
                    
                }
                
            case "4_6":
                if current_4_prompt == "prompt_4_6" {
                    
                 //   let P4_6_endTime = NSDate()
                    
//                    print("P4_6_endTime :", P4_6_endTime.timeIntervalSinceReferenceDate)
                    
                    P4_6_duration = 0
                    
                    print("P4_6_duration :", P4_6_duration)
                    
                    current_4_prompt = "Four Done"
                    
                }
                
                
                
                
            default:
                NSLog("%@", "LVC - Unknown color value received: \(colorString)")
            }
            
        }
                
                
                
                
                //L - What are all the colors for?
            }
        }



