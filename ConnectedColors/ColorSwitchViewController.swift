import UIKit
import AVFoundation
//var myGlobalPlayerNum = Int()

var passTrigger = 0
var rushingTrigger = 0
var promptSwitch_1 = 1
var promptSwitch_2 = 1
var promptSwitch_3 = 1
var promptSwitch_4 = 1

var playerOneComplete = false
var playerTwoComplete = false
var playerThreeComplete = false
var playerFourComplete = false

var playerOneScore = 0
var playerTwoScore = 0
var playerThreeScore = 0
var playerFourScore = 0

var progState = 0

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

var P2_1_startTime = 0
var P2_2_startTime = 0
var P2_3_startTime = 0
var P2_4_startTime = 0
var P2_5_startTime = 0
var P2_6_startTime = 0

var P3_1_startTime = 0
var P3_2_startTime = 0
var P3_3_startTime = 0
var P3_4_startTime = 0
var P3_5_startTime = 0
var P3_6_startTime = 0

var P4_1_startTime = 0
var P4_2_startTime = 0
var P4_3_startTime = 0
var P4_4_startTime = 0
var P4_5_startTime = 0
var P4_6_startTime = 0

var gameState = false


class ColorSwitchViewController: UIViewController {
    
    var openingSoundEffect: AVAudioPlayer!
    var hornSoundEffect: AVAudioPlayer!
    var brain = GameModel()
    var myGlobalPlayerNum = Int()
    var numPlayers = 0
    
    var currentCount = 40
    var timeValue_1 = 0
    var progressAmount = 0
    var myCurrentAnswer = "start"

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
        
        game_1_Button.alpha = 0.0
        game_2_Button.alpha = 0.0
        game_3_Button.alpha = 0.0
        game_4_Button.alpha = 0.0
        game_5_Button.alpha = 0.0
        
        progress_1.alpha = 0.0
        progress_2.alpha = 0.0
        progress_3.alpha = 0.0
        progress_4.alpha = 0.0
        progress_5.alpha = 0.0
        progress_6.alpha = 0.0
        progress_7.alpha = 0.0
        
        Timer.scheduledTimer(timeInterval: 0.001,
                             target: self,
                             selector: #selector(self.updateTime),
                             userInfo: nil,
                             repeats: true)
        
        
    }
    
    func resetApp(){
        
        self.playerDownStackView.alpha = 0.0 // L - What does this do
        
        currentCount = 40
        timeValue_1 = 0
        progressAmount = 0
        current_1_prompt = "prompt_1_1"
        current_2_prompt = "prompt_2_1"
        current_3_prompt = "prompt_3_1"
        current_4_prompt = "prompt_4_1"
        
        
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
        
        game_1_Button.alpha = 0.0
        game_2_Button.alpha = 0.0
        game_3_Button.alpha = 0.0
        game_4_Button.alpha = 0.0
        game_5_Button.alpha = 0.0
        
    }
    
    func resetGame(){
        
        self.playerDownStackView.alpha = 0.0 // L - What does this do
        
        currentCount = 40
        timeValue_1 = 0
        progressAmount = 0
        
        P1_1_startTime = currentCount
        P2_1_startTime = currentCount
        P3_1_startTime = currentCount
        P4_1_startTime = currentCount
        promptSwitch_1 = 1
        promptSwitch_2 = 1
        promptSwitch_3 = 1
        promptSwitch_4 = 1
        UIView.animate(withDuration: 0.5, animations: {
            self.progress_1.alpha = 0.0
            self.progress_2.alpha = 0.0
            self.progress_3.alpha = 0.0
            self.progress_4.alpha = 0.0
            self.progress_5.alpha = 0.0
            self.progress_6.alpha = 0.0
            self.progress_7.alpha = 0.0
        })
        advancePrompt()
        
    }
    
    
    func updateTime(){
        
        
        timeValue_1 += 1
        
        if timeValue_1 % 700 == 0 {
            
            
            if myGlobalPlayerNum == 1 {
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
        if gameState == true {
      
    currentCount -= 1
        clockDisplay.text = String(currentCount)
        updateProgBar()
        checkGameStatus()
            
        }
    }
    
    func checkGameStatus() {
        
        switch numPlayers {
            
        case 2:
            if playerOneScore == 0 {
                if playerOneComplete {
                    playerOneScore = currentCount
                }
            }
            if playerTwoScore == 0 {
                if playerTwoComplete {
                    playerTwoScore = currentCount
                }
            }
            
            if playerOneComplete && playerTwoComplete {
                
                print("Game Over")
                
                
            }
            
        case 3:
            if playerOneScore == 0 {
                if playerOneComplete {
                    playerOneScore = currentCount
                }
            }
            if playerTwoScore == 0 {
                if playerTwoComplete {
                    playerTwoScore = currentCount
                }
            }
            if playerThreeScore == 0 {
                if playerThreeComplete {
                    playerThreeScore = currentCount
                }
            }
            
            if playerOneComplete && playerTwoComplete && playerThreeComplete {
                
                print("Game Over")
                
                
            }
            
        case 4:
            if playerOneScore == 0 {
                if playerOneComplete {
                    playerOneScore = currentCount
                }
            }
            if playerTwoScore == 0 {
                if playerTwoComplete {
                    playerTwoScore = currentCount
                }
            }
            if playerThreeScore == 0 {
                if playerThreeComplete {
                    playerThreeScore = currentCount
                }
            }
            if playerFourScore == 0 {
                if playerFourComplete {
                    playerFourScore = currentCount
                }
            }
            
            if playerOneComplete && playerTwoComplete && playerThreeComplete && playerFourComplete {
                
                
                print("Game Over")
                
            }
            
        default:
            print("Unexpected Number of Players")
        }
        
    }
    
    
    func updateProgBar(){
        
        progState += 1
        if progState == 8 {
            progState = 0
            advancePrompt()
        }
        
        switch progState {
        
        case 0:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_1.alpha = 0.0
                self.progress_2.alpha = 0.0
                self.progress_3.alpha = 0.0
                self.progress_4.alpha = 0.0
                self.progress_5.alpha = 0.0
                self.progress_6.alpha = 0.0
                self.progress_7.alpha = 0.0
            })
        case 1:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_1.alpha = 1.0})
        case 2:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_2.alpha = 1.0})
        case 3:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_3.alpha = 1.0})
        case 4:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_4.alpha = 1.0})
        case 5:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_5.alpha = 1.0})
        case 6:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_6.alpha = 1.0})
        case 7:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_7.alpha = 1.0})
            
        default:
            print("Unknown progress bar state reached")
        }
        
        
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
    

    @IBOutlet weak var answerBox: UILabel!
    
    @IBOutlet weak var promptBox: UILabel!
    
    @IBOutlet weak var game_1_Button: UIButton!
    @IBOutlet weak var game_2_Button: UIButton!
    @IBOutlet weak var game_3_Button: UIButton!
    @IBOutlet weak var game_4_Button: UIButton!
    @IBOutlet weak var game_5_Button: UIButton!
    @IBOutlet weak var game_6_Button: UIButton!
    
    @IBOutlet weak var progress_1: UIView!
    @IBOutlet weak var progress_2: UIView!
    @IBOutlet weak var progress_3: UIView!
    @IBOutlet weak var progress_4: UIView!
    @IBOutlet weak var progress_5: UIView!
    @IBOutlet weak var progress_6: UIView!
    @IBOutlet weak var progress_7: UIView!
    
    
    
    
    
    @IBAction func resetButton(_ sender: Any) {
        colorService.sendColor("gameReset")
        resetGame()
    }
    
    
    @IBAction func panel_1_Button(_ sender: UIButton!) {
        
        print("Button 1")
        print("myGlobalPlayernum: \(myGlobalPlayerNum)")
        print("promptSwitch_1): \(promptSwitch_1)")
        print("promptSwitch_2): \(promptSwitch_2)")
        print("myCurrentAnswer): \(myCurrentAnswer)")
        switch myGlobalPlayerNum {
        case 1:
            colorService.sendColor("1_1")
        case 2:
            colorService.sendColor("2_1")
        case 3:
            colorService.sendColor("3_1")
        case 4:
            colorService.sendColor("4_1")
        default:
            print("No valid GlobalPlayerNum")
        }
    }
    
    @IBAction func panel_2_Button(_ sender: UIButton!) {
        print("Button 2")
        print("myGlobalPlayernum: \(myGlobalPlayerNum)")
        print("promptSwitch_1): \(promptSwitch_1)")
        print("promptSwitch_2): \(promptSwitch_2)")
        print("myCurrentAnswer): \(myCurrentAnswer)")
        switch myGlobalPlayerNum {
        case 1:
            colorService.sendColor("1_2")
        case 2:
            colorService.sendColor("2_2")
        case 3:
            colorService.sendColor("3_2")
        case 4:
            colorService.sendColor("4_2")
        default:
            print("No valid GlobalPlayerNum")
        }
    }
    @IBAction func panel_3_Button(_ sender: UIButton!) {
        print("Button 3")
        print("myGlobalPlayernum: \(myGlobalPlayerNum)")
        print("promptSwitch_1): \(promptSwitch_1)")
        print("promptSwitch_2): \(promptSwitch_2)")
        print("myCurrentAnswer): \(myCurrentAnswer)")
        switch myGlobalPlayerNum {
        case 1:
            colorService.sendColor("1_3")
        case 2:
            colorService.sendColor("2_3")
        case 3:
            colorService.sendColor("3_3")
        case 4:
            colorService.sendColor("4_3")
        default:
            print("No valid GlobalPlayerNum")
        }
    }
    @IBAction func panel_4_Button(_ sender: UIButton!) {
        print("Button 4")
        print("myGlobalPlayernum: \(myGlobalPlayerNum)")
        print("promptSwitch_1): \(promptSwitch_1)")
        print("promptSwitch_2): \(promptSwitch_2)")
        print("myCurrentAnswer): \(myCurrentAnswer)")
        switch myGlobalPlayerNum {
        case 1:
            colorService.sendColor("1_4")
        case 2:
            colorService.sendColor("2_4")
        case 3:
            colorService.sendColor("3_4")
        case 4:
            colorService.sendColor("4_4")
        default:
            print("No valid GlobalPlayerNum")
        }
    }
    
    @IBAction func panel_5_Button(_ sender: UIButton!) {
        print("Button 5")
        print("myGlobalPlayernum: \(myGlobalPlayerNum)")
        print("promptSwitch_1): \(promptSwitch_1)")
        print("promptSwitch_2): \(promptSwitch_2)")
        print("myCurrentAnswer): \(myCurrentAnswer)")
        switch myGlobalPlayerNum {
        case 1:
            colorService.sendColor("1_5")
        case 2:
            colorService.sendColor("1_5")
        case 3:
            colorService.sendColor("1_5")
        case 4:
            colorService.sendColor("1_5")
        default:
            print("No valid GlobalPlayerNum")
        }
    }
    
    @IBAction func panel_6_Button(_ sender: UIButton!) {
        print("Button 6")
        print("myGlobalPlayernum: \(myGlobalPlayerNum)")
        print("promptSwitch_1): \(promptSwitch_1)")
        print("promptSwitch_2): \(promptSwitch_2)")
        print("myCurrentAnswer): \(myCurrentAnswer)")
        switch myGlobalPlayerNum {
        case 1:
            colorService.sendColor("1_6")
        case 2:
            colorService.sendColor("1_6")
        case 3:
            colorService.sendColor("1_6")
        case 4:
            colorService.sendColor("1_6")
        default:
            print("No valid GlobalPlayerNum")
        }
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
        
        
        
    }
    
    func updatePlayerNumDisplay(){
        self.PlayerNum_Label.text = String(myGlobalPlayerNum)
    }
    
    
    
    
    func advancePrompt(){
        
        
       // self.playCountDown()
        
        if myGlobalPlayerNum == 1 {
            
            switch promptSwitch_1 {
            case 1:
                changePrompt (whichPrompt: 1)
                promptSwitch_1 = 2
            case 2:
                changePrompt (whichPrompt: 2)
                promptSwitch_1 = 3
            case 3:
                changePrompt (whichPrompt: 3)
                promptSwitch_1 = 4
            case 4:
                changePrompt (whichPrompt: 4)
                promptSwitch_1 = 5
            case 5:
                changePrompt (whichPrompt: 5)
                promptSwitch_1 = 6
            case 6:
                changePrompt (whichPrompt: 6)
            default:
                print("Bob")
            }
        }
        
            if myGlobalPlayerNum == 2 {
                
                switch promptSwitch_2 {
                case 1:
                    changePrompt (whichPrompt: 1)
                    promptSwitch_2 = 2
                case 2:
                    changePrompt (whichPrompt: 2)
                    promptSwitch_2 = 3
                case 3:
                    changePrompt (whichPrompt: 3)
                    promptSwitch_2 = 4
                case 4:
                    changePrompt (whichPrompt: 4)
                    promptSwitch_2 = 5
                case 5:
                    changePrompt (whichPrompt: 5)
                    promptSwitch_2 = 6
                case 6:
                    changePrompt (whichPrompt: 6)
                default:
                    print("Bob")
                    }
                }
        
        if myGlobalPlayerNum == 3 {
        
            switch promptSwitch_3 {
                case 1:
                changePrompt (whichPrompt: 1)
                case 2:
                    changePrompt (whichPrompt: 2)
                case 3:
                    changePrompt (whichPrompt: 3)
                case 4:
                    changePrompt (whichPrompt: 3)
                case 5:
                    changePrompt (whichPrompt: 3)
                case 6:
                    changePrompt (whichPrompt: 3)
                default:
                    print("Bob")
                    }
                }
        
        if myGlobalPlayerNum == 4 {
            
            switch promptSwitch_4 {
            case 1:
                changePrompt (whichPrompt: 1)
            case 2:
                changePrompt (whichPrompt: 2)
            case 3:
                changePrompt (whichPrompt: 3)
            case 4:
                changePrompt (whichPrompt: 3)
            case 5:
                changePrompt (whichPrompt: 3)
            case 6:
                changePrompt (whichPrompt: 3)
            default:
                print("Bob")
            }
        }
        
        answerBox.text = myCurrentAnswer
        
        if myGlobalPlayerNum == 1 {
            promptBox.text = String(promptSwitch_1)
        }
        
        if myGlobalPlayerNum == 2 {
            promptBox.text = String(promptSwitch_2)
        }
        
        }
    

    
    
    func changePrompt(whichPrompt: Int){
        
        
        if numPlayers == 2 {
            
            //            self.callText_1.text = "Offensive Gaurds Lineup"
            //            self.callText_2.text = "Wide Receiver in Slot Position"
            //            self.callText_3.text = "Set Crowd Noise to Insane"
            //            self.callText_4.text = "Run Block"
            //            self.callText_5.text = "Play Action Fake"
            //            self.callText_6.text = "Hook and Ladder Hook"
            
            if myGlobalPlayerNum == 1 {
                
                switch whichPrompt {
                    
                case 1:
                    self.taskPanel.text = String("Set Crowd Noise to Insane")
                    promptSwitch_1 = 2
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_3")
                   // myCurrentAnswer = "2_3"
                case 2:
                    self.taskPanel.text = String("Hook and Ladder")
                    promptSwitch_1 = 3
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_6")
                    //myCurrentAnswer = "2_6"
                case 3:
                    self.taskPanel.text = String("Offensive Guards Lineup")
                    promptSwitch_1 = 4
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_1")
                    //myCurrentAnswer = "2_1"
                case 4:
                    self.taskPanel.text = String("Play Action Fake")
                    promptSwitch_1 = 5
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_5")
                    //myCurrentAnswer = "2_5"
                case 5:
                    self.taskPanel.text = String("Wide Receiver in Slot Position")
                    promptSwitch_1 = 6
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_2")
                    //myCurrentAnswer = "2_2"
                case 6:
                    self.taskPanel.text = String("Run Block to 3 Yards")
                    //promptSwitch_1 = 6
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_4")
                    //myCurrentAnswer = "2_4"
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            
            if myGlobalPlayerNum == 2 {
                
                //            self.callText_1.text = "Drag Route In"
                //            self.callText_2.text = "Off Tackle Outside"
                //            self.callText_3.text = "Pass Block Step Back"
                //            self.callText_4.text = "Forward Pass"
                //            self.callText_5.text = "Flea Flicker to Running Back"
                //            self.callText_6.text = "Rushing Yards to 10"
                
                
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Forward Pass")
                    promptSwitch_2 = 2
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_4")
                    print("Setting Player One's answer to 1_4")
                    //myCurrentAnswer = "1_4"
                case 2:
                    self.taskPanel.text = String("Rush 10 Yards")
                    promptSwitch_2 = 3
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_6")
                    print("Setting Player One's answer to 1_6")
                    //myCurrentAnswer = "1_6"
                case 3:
                    self.taskPanel.text = String("Drag Route In")
                    promptSwitch_2 = 4
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_1")
                    print("Setting Player One's answer to 1_1")
                    //myCurrentAnswer = "1_1"
                case 4:
                    self.taskPanel.text = String("Flea Flicker to Running Back")
                    promptSwitch_2 = 5
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_5")
                    print("Setting Player One's answer to 1_5")
                    //myCurrentAnswer = "1_5"
                case 5:
                    self.taskPanel.text = String("Off Tackle to Outside")
                    promptSwitch_2 = 6
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_2")
                    print("Setting Player One's answer to 1_2")
                    //myCurrentAnswer = "1_2"
                case 6:
                    self.taskPanel.text = String("Pass Block Step Back")
                    //promptSwitch_2 = 6
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_3")
                    print("Setting Player One's answer to 1_3")
                    //myCurrentAnswer = "1_3"
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
                
                
                
            else if numPlayers == 4 {
                
                if myGlobalPlayerNum == 1 {
                    
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
                
                
                if myGlobalPlayerNum == 2 {
                    
                    
                    
                    switch whichPrompt {
                    case 2:
                        self.taskPanel.text = String("Slam 6 Yards")
                        promptSwitch_1 = 2
                    case 3:
                        self.taskPanel.text = String("Upback 2 yards")
                        promptSwitch_1 = 3
                    case 4:
                        self.taskPanel.text = String("Throw Red Challenge Flag")
                        promptSwitch_1 = 4
                    case 5:
                        self.taskPanel.text = String("Pass Block Step Back")
                        promptSwitch_1 = 5
                    case 6:
                        self.taskPanel.text = String("Water Boy to Empty")
                    default:
                        self.taskPanel.text = String("Default Called")
                    }
                }
                
                
                if myGlobalPlayerNum == 3 {
                    
                    switch whichPrompt {
                    case 2:
                        self.taskPanel.text = String("Rushing Yeards 10")
                        promptSwitch_1 = 2
                    case 3:
                        self.taskPanel.text = String("Hook and Ladder")
                        promptSwitch_1 = 3
                    case 4:
                        self.taskPanel.text = String("Drag Route In")
                        promptSwitch_1 = 4
                    case 5:
                        self.taskPanel.text = String("Gunner to Tackle")
                        promptSwitch_1 = 5
                    case 6:
                        self.taskPanel.text = String("Off Tackle Outside")
                    default:
                        self.taskPanel.text = String("Default Called")
                    }
                }
                
                
                if myGlobalPlayerNum == 4 {
                    
                    switch whichPrompt {
                    case 2:
                        self.taskPanel.text = String("Wide Receiver in Slot Position")
                        promptSwitch_1 = 2
                    case 3:
                        self.taskPanel.text = String("Flea Flicker")
                        promptSwitch_1 = 3
                    case 4:
                        self.taskPanel.text = String("Quarterback Sneak")
                        promptSwitch_1 = 4
                    case 5:
                        self.taskPanel.text = String("Offensive Guards Lineup")
                        promptSwitch_1 = 5
                    case 6:
                        self.taskPanel.text = String("Punt Return 45 Yards")
                    default:
                        self.taskPanel.text = String("Default Called")
                    }
                    
                }
            }
        }
    }
    
    
    func sendCurrentAnswer(thePlayer: Int, theAnswer: String){
    
        colorService.sendColor("*" + "\(thePlayer)" + " - " + "\(theAnswer)")
        
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
        
        game_1_Button.alpha = 1.0
        game_2_Button.alpha = 1.0
        game_3_Button.alpha = 1.0
        game_4_Button.alpha = 1.0
        game_5_Button.alpha = 1.0
        
        currentCount = 40
        clockDisplay.alpha = 1.0
        roundCountView.alpha = 1.0
      //  playCountDown()
        P1_1_startTime = currentCount
        P2_1_startTime = currentCount
        P3_1_startTime = currentCount
        P4_1_startTime = currentCount
        
        gameState = true
        
    }
    
    
    func setUpGameScreen_1_1 (){
        
        setUpGameScreenElements()
        
        //taskPanel.text = "Set Crowd Noise to Insane"
        advancePrompt()
        
        self.callText_1.text = "Drag Route In"
        self.callText_2.text = "Off Tackle Outside"
        self.callText_3.text = "Pass Block Step Back"
        self.callText_4.text = "Forward Pass"
        self.callText_5.text = "Flea Flicker to Running Back"
        self.callText_6.text = "Rush 10 Yards"
        colorService.sendColor("gameReset")
        myCurrentAnswer = "1_4"
        resetGame()
    }
    
    func setUpGameScreen_2_1 (){
        
        setUpGameScreenElements()
        
        //taskPanel.text = "Forward Pass 20 Yards"
        advancePrompt()
        
        self.callText_1.text = "Offensive Gaurds Lineup"
        self.callText_2.text = "Wide Receiver in Slot Position"
        self.callText_3.text = "Set Crowd Noise to Insane"
        self.callText_4.text = "Run Block"
        self.callText_5.text = "Play Action Fake"
        self.callText_6.text = "Hook and Ladder Hook"
        myCurrentAnswer = "3_2"
        colorService.sendColor("gameReset")
        resetGame()
    }
    
    func setUpGameScreen_3_1 (){
        
        setUpGameScreenElements()
        advancePrompt()

        
        self.callText_1.text = "Upback"
        self.callText_2.text = "Water Boy to Empty"
        self.callText_3.text = "Protect Pocket"
        self.callText_4.text = "Quarterback Sneak"
        self.callText_5.text = "Screen Pass Behind Line"
        self.callText_6.text = "Slam"
        
    }
    
    func setUpGameScreen_4_1 (){
        
        setUpGameScreenElements()
        advancePrompt()
        
        self.callText_1.text = "Upback"
        self.callText_2.text = "Water Boy to Empty"
        self.callText_3.text = "Protect Pocket"
        self.callText_4.text = "Quarterback Sneak"
        self.callText_5.text = "Screen Pass Behind Line"
        self.callText_6.text = "Slam"

    }
    
    
    func sendCorrectAnswer(thePlayer: Int, theAnswer: String) {
    
    //sendCurrentAnswer(thePlayer: 2, theAnswer: "2_6")
   
    
    
    
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
                
            case "gameReset":
                self.resetGame()
               
                
            case "1_1":
                if self.myCurrentAnswer == "1_1"{
                    self.advancePrompt()
                }
                
                
            case "1_2":
                if self.myCurrentAnswer == "1_2"{
                    self.advancePrompt()
                }
                
            case "1_3":
                if self.myCurrentAnswer == "1_3"{
                    self.advancePrompt()
                }
                
            case "1_4":
                
                print("Got color 1_4.  - Locker view - myCurrentAnswer is:", self.myCurrentAnswer)
                
                if self.myCurrentAnswer == "1_4" {
                    //self.advancePrompt()
                  //  sendCorrectAnswer(play)
                    
                }
                
            case "1_5":
                
                if self.myCurrentAnswer == "1_5"{
                    self.advancePrompt()
                }
                
            case "1_6":
            
                    if self.myCurrentAnswer == "1_6"{
                        self.advancePrompt()
                    }

                
            case "2_1":
                
                if self.myCurrentAnswer == "2_1"{
                    self.advancePrompt()
                }
                
            case "2_2":
                if self.myCurrentAnswer == "2_2"{
                    self.advancePrompt()
                }
                
                
            case "2_3":
                
                if self.myCurrentAnswer == "2_3"{
                    self.advancePrompt()
                }
                
            case "2_4":
                if self.myCurrentAnswer == "2_4"{
                    self.advancePrompt()
                }
                
            case "2_5":
                if self.myCurrentAnswer == "2_5"{
                    self.advancePrompt()
                }
                
            case "2_6":
                if self.myCurrentAnswer == "2_6"{
                    self.advancePrompt()
                }
                
            case "3_1":
                if self.myCurrentAnswer == "3_1"{
                    self.advancePrompt()
                }
                
            case "3_2":
                if self.myCurrentAnswer == "3_2"{
                    self.advancePrompt()
                }
                
            case "3_3":
                if self.myCurrentAnswer == "3_3"{
                    self.advancePrompt()
                }
                
            case "3_4":
                if self.myCurrentAnswer == "3_4"{
                    self.advancePrompt()
                }
                
            case "3_5":
                if self.myCurrentAnswer == "3_5"{
                    self.advancePrompt()
                }
                
            case "3_6":
                if self.myCurrentAnswer == "3_6"{
                    self.advancePrompt()
                }
                
            case "4_1":
                if self.myCurrentAnswer == "4_1"{
                    self.advancePrompt()
                }
                
            case "4_2":
                if self.myCurrentAnswer == "4_2"{
                    self.advancePrompt()
                }
                
            case "4_3":
                if self.myCurrentAnswer == "4_3"{
                    self.advancePrompt()
                }
                
            case "4_4":
                if self.myCurrentAnswer == "4_4"{
                    self.advancePrompt()
                }
                
                
            case "4_5":
                if self.myCurrentAnswer == "4_5"{
                    self.advancePrompt()
                }
                
            case "4_6":
                if self.myCurrentAnswer == "4_6"{
                    self.advancePrompt()
                }
                
                //setting up the right answers dynamically
                
            case "*1 - 1_1":
                print("Received *1 - 1_1")
                if self.myGlobalPlayerNum == 1 {
                    self.myCurrentAnswer = "1_1"
                }
                
            case "*1 - 1_2":
                 print("Received *1 - 1_2")
                if self.myGlobalPlayerNum == 1 {
                    self.myCurrentAnswer = "1_2"
                }
                
            case "*1 - 1_3":
                 print("Received *1 - 1_3")
                if self.myGlobalPlayerNum == 1 {
                    self.myCurrentAnswer = "1_3"
                }
                
            case "*1 - 1_4":
                 print("Received *1 - 1_4")
                if self.myGlobalPlayerNum == 1 {
                    self.myCurrentAnswer = "1_4"
                }
                
            case "*1 - 1_5":
                 print("Received *1 - 1_5")
                if self.myGlobalPlayerNum == 1 {
                    self.myCurrentAnswer = "1_5"
                }
                
            case "*1 - 1_6":
                 print("Received *1 - 1_6")
                if self.myGlobalPlayerNum == 1 {
                    self.myCurrentAnswer = "1_6"
                }
                
            case "*2 - 2_1":
                 print("Received *2 - 2_1")
                if self.myGlobalPlayerNum == 2 {
                    self.myCurrentAnswer = "2_1"
                }
                
            case "*2 - 2_2":
                 print("Received *2 - 2_2")
                if self.myGlobalPlayerNum == 2 {
                    self.myCurrentAnswer = "2_2"
                }
                
            case "*2 - 2_3":
                 print("Received *2 - 2_3")
                if self.myGlobalPlayerNum == 2 {
                    self.myCurrentAnswer = "2_3"
                }
                
            case "*2 - 2_4":
                 print("Received *2 - 2_4")
                if self.myGlobalPlayerNum == 2 {
                    self.myCurrentAnswer = "2_4"
                }
                
            case "*2 - 2_5":
                 print("Received *2 - 2_5")
                if self.myGlobalPlayerNum == 2 {
                    self.myCurrentAnswer = "2_5"
                }
                
            case "*2 - 2_6":
                 print("Received *2 - 2_6")
                if self.myGlobalPlayerNum == 2 {
                    self.myCurrentAnswer = "2_6"
                }
                
                
            default:
                NSLog("%@", "LVC - Unknown color value received: \(colorString)")
            }
            
        }
                
                
                
                
                //L - What are all the colors for?
            }
        }



