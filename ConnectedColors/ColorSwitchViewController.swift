import UIKit
import AVFoundation
//var myGlobalPlayerNum = Int()

var roundNumber = 1

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

var lockerState = 0
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

let limeGreen = UIColor(red:0.45, green:0.71, blue:0.40, alpha:1.0)

let hangtimeGreen = UIColor(red:0.00, green:0.43, blue:0.00, alpha:1.0)

let HTDKGreen = UIColor(red:0.00, green:0.23, blue:0.00, alpha:1.0)

let successYellow = UIColor(red:0.99, green:0.97, blue:0.55, alpha:1.0)



class ColorSwitchViewController: UIViewController {
    
    var openingSoundEffect: AVAudioPlayer!
    var hornSoundEffect: AVAudioPlayer!
    var bellSoundEffect: AVAudioPlayer!
    var whistleSoundEffect: AVAudioPlayer!
    var brain = GameModel()
    var myGlobalPlayerNum = Int()
    var numPlayers = 0
    
    var currentCount = 40
    var timeValue_1 = 0
    var progressAmount = 0
    var myCurrentAnswer = "start"
    var myLocalAnswer = "begin"

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
        
        scoreField.layer.borderWidth = 3.0
        scoreField.layer.borderColor = UIColor(hexString: "#00a334").cgColor
        scoreField.adjustsFontSizeToFitWidth = true
        scoreField.fitFontForSize()
        scoreField.padding = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 5)
        
        
        
        
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
        
        workAsTeam.alpha = 0.0
        callThePlays.alpha = 0.0
        makeThePlays.alpha = 0.0
        doYourJob.alpha = 0.0
        
        instructionBall.alpha = 0.0
        
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
        
        scorePanelBDrop.alpha = 0.0
        
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
    
    func setUpRoundOne(){
        
        
        P1_1_startTime = currentCount
        P2_1_startTime = currentCount
        P3_1_startTime = currentCount
        P4_1_startTime = currentCount
        promptSwitch_1 = 1
        promptSwitch_2 = 1
        promptSwitch_3 = 1
        promptSwitch_4 = 1
        
        playerOneScore = 0
        playerTwoScore = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.progress_1.alpha = 0.0
            self.progress_2.alpha = 0.0
            self.progress_3.alpha = 0.0
            self.progress_4.alpha = 0.0
            self.progress_5.alpha = 0.0
            self.progress_6.alpha = 0.0
            self.progress_7.alpha = 0.0
        })
        //resetGamePanels()
        advancePrompt()
        
    }
    
    
    
    func resetGame(){
        
        self.playerDownStackView.alpha = 0.0 // L - What does this do
        
        currentCount = 40
        timeValue_1 = 0
        progressAmount = 0
        
        roundNumber += 1
        
        switch numPlayers {
            
        case 2:
            
            switch myGlobalPlayerNum {
                
            case 1:
                myGlobalPlayerNum = 2
            case 2:
                myGlobalPlayerNum = 1
                
            default:
                print("unexpected player num was found")
            }
            
        case 3:
            
            switch myGlobalPlayerNum {
                
            case 1:
                myGlobalPlayerNum = 2
            case 2:
                myGlobalPlayerNum = 3
            case 3:
                myGlobalPlayerNum = 1
                
            default:
                print("unexpected player num was found")
            }
            
        case 4:
            
            switch myGlobalPlayerNum {
                
            case 1:
                myGlobalPlayerNum = 2
            case 2:
                myGlobalPlayerNum = 3
            case 3:
                myGlobalPlayerNum = 4
            case 4:
                myGlobalPlayerNum = 1
                
            default:
                print("unexpected player num was found")
            }
            
        default:
            print("unexpected number of players were found")
        }
        
        updatePlayerNumDisplay()
        
        
        P1_1_startTime = currentCount
        P2_1_startTime = currentCount
        P3_1_startTime = currentCount
        P4_1_startTime = currentCount
        promptSwitch_1 = 1
        promptSwitch_2 = 1
        promptSwitch_3 = 1
        promptSwitch_4 = 1
        
        playerOneScore = 0
        playerTwoScore = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.progress_1.alpha = 0.0
            self.progress_2.alpha = 0.0
            self.progress_3.alpha = 0.0
            self.progress_4.alpha = 0.0
            self.progress_5.alpha = 0.0
            self.progress_6.alpha = 0.0
            self.progress_7.alpha = 0.0
        })
        resetGamePanels()
        advancePrompt()
        
    }
    
    
    func updateTime(){
        
        
        timeValue_1 += 1
        
        if timeValue_1 % 700 == 0 {
            
            
            if myGlobalPlayerNum == 1 {
                currentCount -= 1
                if currentCount < 1 {currentCount = 0}
                // sendTime(currentCount: currentCount)
                colorService.sendColor("updateClockMSG")
                clockDisplay.text = String(currentCount)
                if gameState == true {
                    updateProgBar()
                }
            }
            
        }
    }
    

    
    func sendTime(currentCount: Int){
    
     colorService.sendColor(String(currentCount))
        
    }
    
    
    
    
    func updateClock(){
        if gameState == true {
      
    currentCount -= 1
            if currentCount < 1 {currentCount = 0}
        clockDisplay.text = String(currentCount)
        updateProgBar()
        checkGameStatus()
              print("called checkGameStatus")
        }
    }
    
    func checkGameStatus() {
        
        switch numPlayers {
            
        case 2:
            
            print("playerOneComplete : \(playerOneComplete)")
            print("playerTwoComplete : \(playerTwoComplete)")
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
                self.scoreField.text = String(playerOneScore + playerTwoScore)
                UIView.animate(withDuration: 0.5, animations: {
                    self.scorePanelBDrop.alpha = 1.0
                })
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
                displayScoreScreen()
                
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
                displayScoreScreen()
                
                
            }
            
        default:
            print("Unexpected Number of Players in checkGameStatus")
        }
        
    }
    
    func displayScoreScreen(){
        
        print("Game Over")
        self.scoreField.text = String(playerOneScore + playerTwoScore)
        UIView.animate(withDuration: 0.5, animations: {
            self.scorePanelBDrop.alpha = 1.0

        })
    }
    
    
    func resetProgState(){
       
        let path = Bundle.main.path(forResource: "double-10.mp3", ofType:nil)!
        let bellUrl = URL(fileURLWithPath: path)
        do {
            let sound = try AVAudioPlayer(contentsOf: bellUrl)
            bellSoundEffect = sound
            sound.play()

        } catch {
            // couldn't load file D:
        }
        

//        UIView.animate(withDuration: 0.2, animations: {
////       / self.progress_1.backgroundColor = successYellow
////        self.progress_2.backgroundColor = successYellow
////        self.progress_3.backgroundColor = successYellow
////        self.progress_4.backgroundColor = successYellow
////        self.progress_5.backgroundColor = successYellow
////        self.progress_6.backgroundColor = successYellow
////        self.progress_7.backgroundColor = successYellow
//           })
        
        UIView.animate(withDuration: 0.4, animations: {
        //self.roundCountView.backgroundColor = successYellow
        self.progress_1.alpha = 0.5
        self.progress_2.alpha = 0.5
        self.progress_3.alpha = 0.5
        self.progress_4.alpha = 0.5
        self.progress_5.alpha = 0.5
        self.progress_6.alpha = 0.5
        self.progress_7.alpha = 0.5
        })
        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.progress_1.alpha = 0.0
            self.progress_2.alpha = 0.0
            self.progress_3.alpha = 0.0
            self.progress_4.alpha = 0.0
            self.progress_5.alpha = 0.0
            self.progress_6.alpha = 0.0
            self.progress_7.alpha = 0.0
        })
        
//        self.progress_1.backgroundColor = hangtimeGreen
//        self.progress_2.backgroundColor = hangtimeGreen
//        self.progress_3.backgroundColor = hangtimeGreen
//        self.progress_4.backgroundColor = hangtimeGreen
//        self.progress_5.backgroundColor = hangtimeGreen
//        self.progress_6.backgroundColor = hangtimeGreen
//        self.progress_7.backgroundColor = hangtimeGreen
        
        //self.roundCountView.backgroundColor = HTDKGreen
        
        progState = 0
        
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
                self.progress_1.alpha = 0.5})
        case 2:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_2.alpha = 0.5})
        case 3:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_3.alpha = 0.5})
        case 4:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_4.alpha = 0.5})
        case 5:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_5.alpha = 0.5})
        case 6:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_6.alpha = 0.5})
        case 7:
            UIView.animate(withDuration: 0.5, animations: {
                self.progress_7.alpha = 0.5})
            
        default:
            print("Unknown progress bar state reached")
        }
        
        
    }
    
    
    func playCountDown(){
        roundCountView.loadGif(name: "round_timer_2")
        
    }
    
    func showPlayMovies(){
        play_1_view.loadGif(name: "play1")
        play_2_view.loadGif(name: "play2")
        play_3_view.loadGif(name: "play3")
        play_4_view.loadGif(name: "play4")
        play_5_view.loadGif(name: "play5")
        play_6_view.loadGif(name: "play6")
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
    
    
    @IBOutlet weak var ball_button_control: UIButton!
    
    

    
    
    @IBOutlet weak var HangtimeLogo: UIImageView!
    
    
    
    
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
    
    
    @IBOutlet weak var scoreField: UILabel!
    
    
    
    
    
    @IBOutlet weak var scorePanelBDrop: UIView!
    
    
    
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
            if myLocalAnswer == "1_1" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 2:
            colorService.sendColor("2_1")
            if myLocalAnswer == "2_1" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 3:
            colorService.sendColor("3_1")
            if myLocalAnswer == "3_1" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 4:
            colorService.sendColor("4_1")
            if myLocalAnswer == "4_1" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        default:
            print("No valid GlobalPlayerNum")
        }
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_1_1.alpha = 1.0
            self.play_1_view.alpha = 1.0
            self.panelBkground_1_1.backgroundColor = UIColor.white
            
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
            if myLocalAnswer == "1_2" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 2:
            colorService.sendColor("2_2")
            if myLocalAnswer == "2_2" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 3:
            colorService.sendColor("3_2")
            if myLocalAnswer == "3_2" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 4:
            colorService.sendColor("4_2")
            if myLocalAnswer == "4_2" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        default:
            print("No valid GlobalPlayerNum")
        }
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_2.alpha = 1.0
            self.play_2_view.alpha = 1.0
            self.panelBkground_2.backgroundColor = UIColor.white
           
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
            if myLocalAnswer == "1_3" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 2:
            colorService.sendColor("2_3")
            if myLocalAnswer == "2_3" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 3:
            colorService.sendColor("3_3")
            if myLocalAnswer == "3_3" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 4:
            colorService.sendColor("4_3")
            if myLocalAnswer == "4_3" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        default:
            print("No valid GlobalPlayerNum")
        }
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_3.alpha = 1.0
            self.play_3_view.alpha = 1.0
            self.panelBkground_3.backgroundColor = UIColor.white
            
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
            if myLocalAnswer == "1_4" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 2:
            colorService.sendColor("2_4")
            if myLocalAnswer == "2_4" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 3:
            colorService.sendColor("3_4")
            if myLocalAnswer == "3_4" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        case 4:
            colorService.sendColor("4_4")
            if myLocalAnswer == "4_4" {
                playSuccessSound()
            } else {
                playWhistleSound()
            }
        default:
            print("No valid GlobalPlayerNum")
        }
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_4.alpha = 1.0
            self.play_4_view.alpha = 1.0
            self.panelBkground_4.backgroundColor = UIColor.white
           
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
            colorService.sendColor("2_5")
        case 3:
            colorService.sendColor("3_5")
        case 4:
            colorService.sendColor("4_5")
        default:
            print("No valid GlobalPlayerNum")
        }
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_5.alpha = 1.0
            self.play_5_view.alpha = 1.0
            self.panelBkground_5.backgroundColor = UIColor.white
         
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
            colorService.sendColor("2_6")
        case 3:
            colorService.sendColor("3_6")
        case 4:
            colorService.sendColor("4_6")
        default:
            print("No valid GlobalPlayerNum")
        }
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_6.alpha = 1.0
            self.play_6_view.alpha = 1.0
            self.panelBkground_6.backgroundColor = UIColor.white
           
        }
    }
    
    @IBAction func panel_1_touchDown(_ sender: Any) {
        self.play_1_view.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_1_1.alpha = 0.5
            
            self.panelBkground_1_1.backgroundColor = limeGreen
           
        }
        
    }
    
    @IBAction func panel_2_touchDown(_ sender: Any) {
        self.play_2_view.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_2.alpha = 0.5
            
            self.panelBkground_2.backgroundColor = limeGreen
           
        }
        
    }
    
    @IBAction func panel_3_touchDown(_ sender: Any) {
        self.play_3_view.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_3.alpha = 0.5
            
            self.panelBkground_3.backgroundColor = limeGreen
           
        }
        
    }
    
    @IBAction func panel_4_touchDown(_ sender: Any) {
      self.play_4_view.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_4.alpha = 0.5
         
            self.panelBkground_4.backgroundColor = limeGreen
           
        }
        
    }
    
    @IBAction func panel_5_touchDown(_ sender: Any) {
      self.play_5_view.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_5.alpha = 0.5
            
            self.panelBkground_5.backgroundColor = limeGreen
           
        }
        
    }
    
    @IBAction func panel_6_touchDown(_ sender: Any) {
        self.play_6_view.alpha = 0.0
        UIView.animate(withDuration: 0.2) {
            self.panelBkground_6.alpha = 0.5
            
            self.panelBkground_6.backgroundColor = limeGreen
           
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
    
    @IBOutlet weak var play_1_view: UIImageView!
    
    @IBOutlet weak var play_2_view: UIImageView!
    
    @IBOutlet weak var play_3_view: UIImageView!
    
    @IBOutlet weak var play_4_view: UIImageView!
    
    @IBOutlet weak var play_5_view: UIImageView!
    
    @IBOutlet weak var play_6_view: UIImageView!
    
    
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
            case 7:
                changePrompt (whichPrompt: 7)
            default:
                print("Unexpected Prompt Number in AdvancePrompt")
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
            case 7:
                changePrompt (whichPrompt: 7)
            default:
                print("Unexpected Prompt Number in AdvancePrompt")
            }
        }
        
        if myGlobalPlayerNum == 3 {
            
            switch promptSwitch_3 {
            case 1:
                changePrompt (whichPrompt: 1)
                promptSwitch_3 = 2
            case 2:
                changePrompt (whichPrompt: 2)
                promptSwitch_3 = 3
            case 3:
                changePrompt (whichPrompt: 3)
                promptSwitch_3 = 4
            case 4:
                changePrompt (whichPrompt: 4)
                promptSwitch_3 = 5
            case 5:
                changePrompt (whichPrompt: 5)
                promptSwitch_3 = 6
            case 6:
                changePrompt (whichPrompt: 6)
            case 7:
                changePrompt (whichPrompt: 7)
            default:
                print("Unexpected Prompt Number in AdvancePrompt")
            }
        }
        
        if myGlobalPlayerNum == 4 {
            
            switch promptSwitch_4 {
            case 1:
                changePrompt (whichPrompt: 1)
                promptSwitch_4 = 2
            case 2:
                changePrompt (whichPrompt: 2)
                promptSwitch_4 = 3
            case 3:
                changePrompt (whichPrompt: 3)
                promptSwitch_4 = 4
            case 4:
                changePrompt (whichPrompt: 4)
                promptSwitch_4 = 5
            case 5:
                changePrompt (whichPrompt: 5)
                promptSwitch_4 = 6
            case 6:
                changePrompt (whichPrompt: 6)
            case 7:
                changePrompt (whichPrompt: 7)
            default:
                print("Unexpected Prompt Number in AdvancePrompt")
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
        
        print("got to changePrompt - top of function")
        print("numPlayers: \(numPlayers)")
        
        if numPlayers == 2 {
            
            
            if myGlobalPlayerNum == 1 {
                
                switch whichPrompt {
                    
                case 1:
                    self.taskPanel.text = String("Set Crowd Noise to Insane")
                    promptSwitch_1 = 2
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_3")
                    myCurrentAnswer = "2_3"
                case 2:
                    self.taskPanel.text = String("Hook and Ladder")
                    promptSwitch_1 = 3
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_6")
                    myCurrentAnswer = "2_6"
                case 3:
                    self.taskPanel.text = String("Offensive Guards Lineup")
                    promptSwitch_1 = 4
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_1")
                    myCurrentAnswer = "2_1"
                case 4:
                    self.taskPanel.text = String("Play Action Fake")
                    promptSwitch_1 = 5
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_5")
                    myCurrentAnswer = "2_5"
                case 5:
                    self.taskPanel.text = String("Wide Receiver in Slot Position")
                    promptSwitch_1 = 6
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_2")
                    myCurrentAnswer = "2_2"
                case 6:
                    self.taskPanel.text = String("Run Block to 3 Yards")
                    promptSwitch_1 = 7
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_4")
                    myCurrentAnswer = "2_4"
                case 7:
                    playerOneComplete = true
                    colorService.sendColor("playerOneDone")
                    print("Player One Done")
                    self.taskPanel.text = String("Job Done!")
                    print("playerOneComplete : \(playerOneComplete)")
                    checkGameStatus()
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            
            if myGlobalPlayerNum == 2 {
                
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Forward Pass 20 yards")
                    promptSwitch_2 = 2
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_4")
                    
                    myCurrentAnswer = "1_4"
                case 2:
                    self.taskPanel.text = String("Rush 10 Yards")
                    promptSwitch_2 = 3
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_6")
                    
                    myCurrentAnswer = "1_6"
                case 3:
                    self.taskPanel.text = String("Drag Route In")
                    promptSwitch_2 = 4
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_1")
                    
                    myCurrentAnswer = "1_1"
                case 4:
                    self.taskPanel.text = String("Flea Flicker to Running Back")
                    promptSwitch_2 = 5
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_5")
                    
                    myCurrentAnswer = "1_5"
                case 5:
                    self.taskPanel.text = String("Off Tackle to Outside")
                    promptSwitch_2 = 6
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_2")
                    
                    myCurrentAnswer = "1_2"
                case 6:
                    self.taskPanel.text = String("Pass Block Step Back")
                    promptSwitch_2 = 7
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_3")
                    
                    myCurrentAnswer = "1_3"
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerTwoComplete = true
                    colorService.sendColor("playerTwoDone")
                    print("Player Two Done")
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
        } else if numPlayers == 3 {
            
            print("got to changePrompt for 3 players")
            
            if myGlobalPlayerNum == 1 {
                
                print("got to three player set up for player 1")
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Forward Pass 20 yards")
                    promptSwitch_1 = 2
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_1")
                    
                    myCurrentAnswer = "2_1"
                case 2:
                    self.taskPanel.text = String("Rush 10 Yards")
                    promptSwitch_1 = 3
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_2")
                    
                    myCurrentAnswer = "3_2"
                case 3:
                    self.taskPanel.text = String("Upback 2 Yards")
                    promptSwitch_1 = 4
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_3")
                    
                    myCurrentAnswer = "2_3"
                case 4:
                    self.taskPanel.text = String("Drag Route In")
                    promptSwitch_1 = 5
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_4")
                    
                    myCurrentAnswer = "3_4"
                case 5:
                    self.taskPanel.text = String("Gunner to Tackle")
                    promptSwitch_1 = 6
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_5")
                    
                    myCurrentAnswer = "3_5"
                case 6:
                    self.taskPanel.text = String("Protect Pocket")
                    promptSwitch_1 = 7
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_6")
                    
                    myCurrentAnswer = "1_6"
                    
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerOneComplete = true
                    colorService.sendColor("playerOneDone")
                    print("Player One Done")
                    
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            if myGlobalPlayerNum == 2 {
                
                print("got to three player set up for player 2")
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Set Crowd Noise to Insane")
                    promptSwitch_2 = 2
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_1")
                    
                    myCurrentAnswer = "1_1"
                case 2:
                    self.taskPanel.text = String("Screen Pass Behind Line")
                    promptSwitch_2 = 3
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_2")
                    
                    myCurrentAnswer = "1_2"
                case 3:
                    self.taskPanel.text = String("Hook and Ladder")
                    promptSwitch_2 = 4
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_3")
                    
                    myCurrentAnswer = "3_3"
                case 4:
                    self.taskPanel.text = String("Quarterback Sneak")
                    promptSwitch_2 = 5
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_4")
                    
                    myCurrentAnswer = "1_4"
                case 5:
                    self.taskPanel.text = String("Pass Block Step Back")
                    promptSwitch_2 = 6
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_5")
                    
                    myCurrentAnswer = "2_5"
                case 6:
                    self.taskPanel.text = String("Off Tackle Outside")
                    promptSwitch_2 = 7
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_6")
                    
                    myCurrentAnswer = "3_6"
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerTwoComplete = true
                    colorService.sendColor("playerTwoDone")
                    print("Player Two Done")
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            
            if myGlobalPlayerNum == 3 {
                
                
                
                print(" a check on myGlobalPlayerNum: \(myGlobalPlayerNum)")
                print("whichPrompt: \(whichPrompt)")
                
                switch whichPrompt {
                case 1:
                    print("got to case 1 for whichPrompt in changePrompt - player 3")
                    
                    self.taskPanel.text = String("Flea Flicker")
                    promptSwitch_3 = 2
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_1")
                    myCurrentAnswer = "3_1"
                case 2:
                    self.taskPanel.text = String("Slam 6 Yards")
                    promptSwitch_3 = 3
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_2")
                    myCurrentAnswer = "2_2"
                case 3:
                    self.taskPanel.text = String("Play Action Fake")
                    promptSwitch_3 = 4
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_3")
                    myCurrentAnswer = "1_3"
                case 4:
                    self.taskPanel.text = String("Wide Receiver in Slot Position")
                    promptSwitch_3 = 5
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_4")
                    myCurrentAnswer = "2_4"
                case 5:
                    self.taskPanel.text = String("End Run 45 Yards")
                    promptSwitch_3 = 6
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_5")
                    myCurrentAnswer = "1_5"
                case 6:
                    self.taskPanel.text = String("Water Boy to Empty")
                    promptSwitch_3 = 7
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_6")
                    myCurrentAnswer = "2_6"
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerThreeComplete = true
                    colorService.sendColor("playerThreeDone")
                    print("Player Three Done")
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
        }
            
        else if numPlayers == 4 {
            
            if myGlobalPlayerNum == 1 {
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Set Crowd Noise to Insane")
                    promptSwitch_1 = 2
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_3")
                    
                    myCurrentAnswer = "2_3"
                case 2:
                    self.taskPanel.text = String("Off Tackle Outside")
                    promptSwitch_1 = 3
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_2")
                    
                    myCurrentAnswer = "1_2"
                case 3:
                    self.taskPanel.text = String("Upback 2 Yards")
                    promptSwitch_1 = 4
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_1")
                    
                    myCurrentAnswer = "3_1"
                case 4:
                    self.taskPanel.text = String("Spike Ball in End Zone")
                    promptSwitch_1 = 5
                    sendCurrentAnswer(thePlayer: 4, theAnswer: "4_2")
                    
                    myCurrentAnswer = "4_2"
                case 5:
                    self.taskPanel.text = String("Run Block to 3 Yards")
                    promptSwitch_1 = 6
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_4")
                    
                    myCurrentAnswer = "2_4"
                case 6:
                    self.taskPanel.text = String("Protect Pocket")
                    promptSwitch_1 = 7
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_3")
                    
                    myCurrentAnswer = "3_3"
                case 7:
                    playerOneComplete = true
                    print("Player One Done")
                    colorService.sendColor("playerOneDone")
                    self.taskPanel.text = String("Job Done!")
                    
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            
            if myGlobalPlayerNum == 2 {
                
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Forward Pass 20 Yards")
                    promptSwitch_2 = 2
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_4")
                    
                    myCurrentAnswer = "1_4"
                case 2:
                    self.taskPanel.text = String("Slam 6 Yards")
                    promptSwitch_2 = 3
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_6")
                    
                    myCurrentAnswer = "1_6"
                case 3:
                    self.taskPanel.text = String("Quarterback Audible: Hail Mary")
                    promptSwitch_2 = 4
                    sendCurrentAnswer(thePlayer: 4, theAnswer: "4_3")
                    
                    myCurrentAnswer = "1_1"
                case 4:
                    self.taskPanel.text = String("Hook and Ladder")
                    promptSwitch_2 = 5
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_6")
                    
                    myCurrentAnswer = "2_6"
                case 5:
                    self.taskPanel.text = String("Pass Block Step Back")
                    promptSwitch_2 = 6
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_3")
                    
                    myCurrentAnswer = "1_3"
                case 6:
                    self.taskPanel.text = String("Water Boy to Empty")
                    promptSwitch_2 = 7
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_2")
                    
                    myCurrentAnswer = "3_2"
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerTwoComplete = true
                    colorService.sendColor("playerTwoDone")
                    print("Player Two Done")
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            
            if myGlobalPlayerNum == 3 {
                
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Cheerleaders Make Pyramid")
                    promptSwitch_3 = 2
                    sendCurrentAnswer(thePlayer: 4, theAnswer: "4_4")
                    
                    myCurrentAnswer = "4_4"
                case 2:
                    self.taskPanel.text = String("Rushing Yards 10")
                    promptSwitch_3 = 3
                    
                    
                    myCurrentAnswer = "1_6"
                case 3:
                    self.taskPanel.text = String("Throw Red Challenge Flag")
                    promptSwitch_3 = 4
                    sendCurrentAnswer(thePlayer: 4, theAnswer: "4_1")
                    
                    myCurrentAnswer = "4_1"
                case 4:
                    self.taskPanel.text = String("Drag Route In")
                    promptSwitch_3 = 5
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_1")
                    
                    myCurrentAnswer = "1_1"
                case 5:
                    self.taskPanel.text = String("Gunner to Tackle")
                    promptSwitch_3 = 6
                    sendCurrentAnswer(thePlayer: 4, theAnswer: "4_5")
                    
                    myCurrentAnswer = "4_5"
                case 6:
                    self.taskPanel.text = String("Screen Pass Behind Line")
                    promptSwitch_3 = 7
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_5")
                    
                    myCurrentAnswer = "3_5"
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerThreeComplete = true
                    colorService.sendColor("playerThreeDone")
                    print("Player Three Done")
                default:
                    self.taskPanel.text = String("Default Called")
                }
            }
            
            
            
            if myGlobalPlayerNum == 4 {
                
                switch whichPrompt {
                case 1:
                    self.taskPanel.text = String("Play Action Fake")
                    promptSwitch_4 = 2
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_5")
                    
                    myCurrentAnswer = "2_5"
                case 2:
                    self.taskPanel.text = String("Wide Receiver in Slot Position")
                    promptSwitch_4 = 3
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_2")
                    
                    
                    myCurrentAnswer = "2_2"
                case 3:
                    self.taskPanel.text = String("Flea Flicker")
                    promptSwitch_4 = 4
                    sendCurrentAnswer(thePlayer: 1, theAnswer: "1_5")
                    
                    myCurrentAnswer = "1_5"
                case 4:
                    self.taskPanel.text = String("Quarterback Sneak")
                    promptSwitch_4 = 5
                    sendCurrentAnswer(thePlayer: 3, theAnswer: "3_4")
                    
                    myCurrentAnswer = "3_4"
                case 5:
                    self.taskPanel.text = String("Offensive Guards Lineup")
                    promptSwitch_4 = 6
                    sendCurrentAnswer(thePlayer: 2, theAnswer: "2_1")
                    
                    myCurrentAnswer = "2_1"
                case 6:
                    self.taskPanel.text = String("End Run 45 Yards")
                    promptSwitch_4 = 7
                    sendCurrentAnswer(thePlayer: 4, theAnswer: "4_6")
                    
                    myCurrentAnswer = "4_6"
                case 7:
                    self.taskPanel.text = String("Job Done!")
                    
                    playerFourComplete = true
                    colorService.sendColor("playerFourDone")
                    print("Player Four Done")
                default:
                    self.taskPanel.text = String("Default Called")
                    
                }
            }
        }
    }
    
    
    func sendCurrentAnswer(thePlayer: Int, theAnswer: String){
    
        colorService.sendColor("*" + "\(thePlayer)" + " - " + "\(theAnswer)")
        
    }
    
    func playHornSound(){
        
        let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
        let hornUrl = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: hornUrl)
            hornSoundEffect = sound
            sound.play()
            
            
        } catch {
            // couldn't load file D:
        }
        
        
    }
    
    func playSuccessSound(){
        
        let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
        let hornUrl = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: hornUrl)
            hornSoundEffect = sound
            sound.play()
            
            
        } catch {
            // couldn't load file D:
        }
        
        
    }
    
    
    func playWhistleSound(){
        
        let path = Bundle.main.path(forResource: "ref-whistle.mp3", ofType:nil)!
        let whistleUrl = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: whistleUrl)
            whistleSoundEffect = sound
            sound.play()
            
            
        } catch {
            // couldn't load file D:
        }
        
        
    }
    
    @IBOutlet weak var instructionButton: UIButton!
    
    
    
    @IBAction func instructionButtonTapped(_ sender: Any) {
        
        print("Instruction Button Tapped")
        
        lockerState = 1
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.locker_image.alpha = 0.0 //for zero opacity
            self.locker_image.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
                self.locker_image.alpha = 1.0})
            UIView.animate(withDuration: 0.5, animations: {
                self.playerDownStackView.alpha = 1.0})
            UIView.animate(withDuration: 0.5, animations: {
                self.lockerBall.alpha = 1.0})
            })
        
        self.instructionButton.isEnabled = false
        
    }
 
    
    @IBOutlet weak var instructionBall: UIImageView!
    
    @IBOutlet weak var football: UIImageView!
    
    @IBOutlet weak var field_image: UIImageView!
    
    @IBOutlet weak var workAsTeam: UILabel!
    
    @IBOutlet weak var callThePlays: UILabel!
    
    @IBOutlet weak var makeThePlays: UILabel!
    
    @IBOutlet weak var doYourJob: UILabel!
    
    @IBAction func ball_button(_ sender: UIButton) {
        
//        let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
//        let hornUrl = URL(fileURLWithPath: path)
//
//        print("Ball Button Tapped")
//        do {
//            let sound = try AVAudioPlayer(contentsOf: hornUrl)
//            hornSoundEffect = sound
//            sound.play()
//
//
//        } catch {
//            // couldn't load file D:
//        }
        
        playHornSound()
        
        
        self.ball_button_control.isEnabled = false
        
  
        UIView.animate(withDuration: 0.5, animations: {self.football.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
        })
        
        UIView.animate(withDuration: 0.5, animations: {self.football.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)},
                       completion:{(Bool)  in
                        self.field_image.alpha = 0.0 //for zero opacity
                        self.field_image.isHidden = false
                        
                        UIView.animate(withDuration: 0.5, animations: {
                            self.field_image.alpha = 1.0})
//                        UIView.animate(withDuration: 0.5, animations: {
//                            self.playerDownStackView.alpha = 1.0})
//                        UIView.animate(withDuration: 0.5, animations: {
//                            self.lockerBall.alpha = 1.0})
                    self.animateInstructions()
                        
     })
                        
          // setUpLockerView()
    }
    
    func animateInstructions(){
        
//        workAsTeam.alpha = 0.0
//        callThePlays.alpha = 0.0
//        makeThePlays.alpha = 0.0
//        doYourJob.alpha = 0.0
        self.workAsTeam.isHidden = false
        self.callThePlays.isHidden = false
        self.makeThePlays.isHidden = false
        self.doYourJob.isHidden = false
        self.instructionBall.isHidden = false
        self.instructionButton.isHidden = false
        workAsTeam.alpha = 0.0
        callThePlays.alpha = 0.0
        makeThePlays.alpha = 0.0
        doYourJob.alpha = 0.0
        instructionBall.alpha = 0.0
        
        UIView.animate(
            withDuration: 0.5,
            animations: {
                
                UIView.animate(withDuration: 0.5, delay: 0.0, animations: {
                    self.workAsTeam.alpha = 1.0})
        },
            completion:{ finished in
                if(finished){
                    UIView.animate(
                        withDuration: 0.5,
                        
                        animations: {
                            UIView.animate(withDuration: 0.5, delay: 1.0, animations: {
                                self.callThePlays.alpha = 1.0})
                    },
                        completion:{ finished in
                            if(finished){
                                UIView.animate(
                                    withDuration: 0.5,
                                    
                                    animations: {
                                        UIView.animate(withDuration: 0.5,delay: 2.0, animations: {
                                            self.makeThePlays.alpha = 1.0})
                                },
                                    completion:{ finished in
                                        if(finished){
                                            UIView.animate(
                                                withDuration: 0.5,
                                                
                                                animations: {
                                                    UIView.animate(withDuration: 0.5,delay: 3.0, animations: {
                                                        self.doYourJob.alpha = 1.0})
                                            },
                                                completion:{ finished in
                                                    if(finished){
                                                        UIView.animate(
                                                            withDuration: 0.5,
                                                           
                                                            animations: {
                                                                UIView.animate(withDuration: 0.5,delay: 4.0, animations: {
                                                                    self.instructionBall.alpha = 1.0}
                                                                
                                                                )
                                                        },
                                    
                                    
                                    
                                    completion: { finished in
                                        //   shakeHead(sender)
                                }
                                                        )
                                                    }
                                            }
                                            )
                                        }
                                }
                                )
                            }
                    }
                    )
                }
                
        }
        )
        
        
    }
    
    func jobButtonTapped(){
        
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
                        
//                        UIView.animate(withDuration: 0.5, animations: {
//                            self.turfScreen.alpha = 1.0})
//                       // setUpGameScreen_1_1()
                        
                        
                        
        })
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
             setUpGameScreen_2_Player_1()
        
                
            case 2:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_2_Player_2()
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
            
        }
        if numPlayers == 3 && startOne == true && startTwo == true && startThree == true {
            
            print("got to 3 player checkStart")
            switch myGlobalPlayerNum {
                
            case 1:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                print("got to 3 player checkStart - player 1")
                setUpGameScreen_3_Player_1()
                
            case 2:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                print("got to 3 player checkStart - player 2")
                setUpGameScreen_3_Player_2()
                
            case 3:
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                print("got to 3 player checkStart  - player 3")
                setUpGameScreen_3_Player_3()
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        if numPlayers == 4 && startOne == true && startTwo == true && startThree == true && startFour == true {
            switch myGlobalPlayerNum {
                
            case 1:
          

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_4_Player_1()
                
            case 2:
        

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_4_Player_2()
                
            case 3:
        
        
                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_4_Player_3()
                
            case 4:
                

                UIView.animate(withDuration: 0.5, animations: {
                    self.turfScreen.alpha = 1.0})
                setUpGameScreen_4_Player_4()
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        
    }
    
    func resetGamePanels() {
        
        

        
        if numPlayers == 2  {
            
            switch myGlobalPlayerNum {
                
            case 1:
          
                setUpGameScreen_2_Player_1()
                
                
            case 2:

                setUpGameScreen_2_Player_2()
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
            
        }
        if numPlayers == 3 {
            
            print("got to 3 player checkStart")
            switch myGlobalPlayerNum {
                
            case 1:
                
                setUpGameScreen_3_Player_1()
                
            case 2:
                
                setUpGameScreen_3_Player_2()
                
            case 3:
                
                setUpGameScreen_3_Player_3()
                
                
            default:
                NSLog("%@", "Unknown Player Num: \(myGlobalPlayerNum)")
            }
        }
        if numPlayers == 4  {
            
            switch myGlobalPlayerNum {
                
            case 1:
                
                setUpGameScreen_4_Player_1()
                
            case 2:
                

                setUpGameScreen_4_Player_2()
                
            case 3:
                

                setUpGameScreen_4_Player_3()
                
            case 4:
                

                setUpGameScreen_4_Player_4()
                
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
        
        showPlayMovies()
        
        gameState = true
        
    }
    
    func setUpGameScreen_1_1 (){
        

        //Legacy Function, will be deleted

    }
    
    func setUpGameScreen_2_1 (){
        
        
        //Legacy Function, will be deleted
        
    }
    
    func setUpGameScreen_3_1 (){
        
        
        //Legacy Function, will be deleted
        
    }
    
    func setUpGameScreen_4_1 (){
        
  //Legacy Function, will be deleted
        
    }
    
    
    func setUpGameScreen_2_Player_1 (){
        
        setUpGameScreenElements()
        
        //taskPanel.text = "Set Crowd Noise to Insane"
        advancePrompt()
        
        self.callText_1.text = "Drag Route In"
        self.callText_2.text = "Off Tackle Outside"
        self.callText_3.text = "Pass Block Step Back"
        self.callText_4.text = "Forward Pass"
        self.callText_5.text = "Flea Flicker to Running Back"
        self.callText_6.text = "Rush 10 Yards"
       // colorService.sendColor("gameReset")
        myCurrentAnswer = "1_4"
       setUpRoundOne()
    }
    
    func setUpGameScreen_2_Player_2 (){
        
        setUpGameScreenElements()
        
        //taskPanel.text = "Forward Pass 20 Yards"
        advancePrompt()
        
        self.callText_1.text = "Offensive Gaurds Lineup"
        self.callText_2.text = "Wide Receiver in Slot Position"
        self.callText_3.text = "Set Crowd Noise to Insane"
        self.callText_4.text = "Run Block to 3 Yards"
        self.callText_5.text = "Play Action Fake"
        self.callText_6.text = "Hook and Ladder"
        myCurrentAnswer = "3_2"
       // colorService.sendColor("gameReset")
       setUpRoundOne()
    }
    
    func setUpGameScreen_3_Player_1 (){
        
        setUpGameScreenElements()
        
        //taskPanel.text = "Set Crowd Noise to Insane"
        advancePrompt()
        
        
        self.callText_1.text = "Set Crowd Noise to Insane"
        self.callText_2.text = "Screen Pass Behind Line"
        self.callText_3.text = "Play Action Fake"
        self.callText_4.text = "Quarterback Sneak"
        self.callText_5.text = "End Run 45 Yards"
        self.callText_6.text = "Protect Pocket"
      //  colorService.sendColor("gameReset")
        myCurrentAnswer = "1_4"
      setUpRoundOne()
    }
    
    func setUpGameScreen_3_Player_2 (){
        
        setUpGameScreenElements()
        
        //taskPanel.text = "Forward Pass 20 Yards"
        advancePrompt()
        
        
        self.callText_1.text = "Forward Pass 20 Yards"
        self.callText_2.text = "Slam 6 Yards"
        self.callText_3.text = "Upback 2 Yards"
        self.callText_4.text = "Wide Receiver in Slot Position"
        self.callText_5.text = "Pass Block Step Back"
        self.callText_6.text = "Water Boy to Empty"
        myCurrentAnswer = "3_2"
     //   colorService.sendColor("gameReset")
       setUpRoundOne()
    }
    
    func setUpGameScreen_3_Player_3 (){
        
        setUpGameScreenElements()
        advancePrompt()

        
        self.callText_1.text = "Flea Flicker"
        self.callText_2.text = "Rushing Yards 10"
        self.callText_3.text = "Hook and Ladder"
        self.callText_4.text = "Drag Route In"
        self.callText_5.text = "Gunner to Tackle"
        self.callText_6.text = "Off Tackle Outside"
       setUpRoundOne()
    }
    
    func setUpGameScreen_4_Player_1 (){
        
        setUpGameScreenElements()
        advancePrompt()
        
        self.callText_1.text = "Drag Route In"
        self.callText_2.text = "Off Tackle Outside"
        self.callText_3.text = "Pass Block Step Back"
        self.callText_4.text = "Forward Pass 20 Yards"
        self.callText_5.text = "Flea Flicker to Running Back"
        self.callText_6.text = "Rush 10 Yards"
        setUpRoundOne()
    }
    
    func setUpGameScreen_4_Player_2 (){
        
        setUpGameScreenElements()
        advancePrompt()
        
        self.callText_1.text = "Offensive Gaurds Lineup"
        self.callText_2.text = "Wide Receiver in Slot Position"
        self.callText_3.text = "Set Crowd Noise to Insane"
        self.callText_4.text = "Run Block to 3 Yards"
        self.callText_5.text = "Play Action Fake"
        self.callText_6.text = "Hook and Ladder"
        setUpRoundOne()
    }
    
    func setUpGameScreen_4_Player_3 (){
        
        setUpGameScreenElements()
        advancePrompt()
        
        self.callText_1.text = "Upback 2 Yards"
        self.callText_2.text = "Water Boy to Empty"
        self.callText_3.text = "Protect Pocket"
        self.callText_4.text = "Quarterback Sneak"
        self.callText_5.text = "Screen Pass Behind Line"
        self.callText_6.text = "Slam 6 Yards"
        setUpRoundOne()
    }
    
    func setUpGameScreen_4_Player_4 (){
        
        setUpGameScreenElements()
        advancePrompt()
        
        self.callText_1.text = "Throw Red Challenge Flag"
        self.callText_2.text = "Spike Ball in End Zone"
        self.callText_3.text = "Quarterback Audible: Hail Mary"
        self.callText_4.text = "Cheerleaders Make Pyramid"
        self.callText_5.text = "Gunner to Tackle"
        self.callText_6.text = "End Run 45 Yards"
        setUpRoundOne()
    }
    
    
    func sendCorrectAnswer(thePlayer: Int, theAnswer: String) {
    
    //sendCurrentAnswer(thePlayer: 2, theAnswer: "2_6")
      //  colorService.sendColor("*" + "\(thePlayer)" + " - " + "\(theAnswer)")
     
    
    
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
                if self.myGlobalPlayerNum != 1 {
                self.updateClock()
                }
            case "playChime1":
                if self.myGlobalPlayerNum == 1 {
//                    let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
//                    let hornUrl = URL(fileURLWithPath: path)
//
//                    print("Ball Button Tapped")
//                    do {
//                        let sound = try AVAudioPlayer(contentsOf: hornUrl)
//                        self.hornSoundEffect = sound
//                        sound.play()
//
//                    } catch {
//                        // couldn't load file D:
//                    }
                    self.playHornSound()
                }
            case "playChime2":
                if self.myGlobalPlayerNum == 2 {
//                    let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
//                    let hornUrl = URL(fileURLWithPath: path)
//
//                    print("Ball Button Tapped")
//                    do {
//                        let sound = try AVAudioPlayer(contentsOf: hornUrl)
//                        self.hornSoundEffect = sound
//                        sound.play()
//
//
//                    } catch {
//                        // couldn't load file D:
//                    }
                    self.playHornSound()
                }
            case "playChime3":
                if self.myGlobalPlayerNum == 3 {
//                    let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
//                    let hornUrl = URL(fileURLWithPath: path)
//
//                    print("Ball Button Tapped")
//                    do {
//                        let sound = try AVAudioPlayer(contentsOf: hornUrl)
//                        self.hornSoundEffect = sound
//                        sound.play()
//
//
//                    } catch {
//                        // couldn't load file D:
//                    }
                    self.playHornSound()
                }
            case "playChime4":
                if self.myGlobalPlayerNum == 4 {
//                    let path = Bundle.main.path(forResource: "air horn (club sample).mp3", ofType:nil)!
//                    let hornUrl = URL(fileURLWithPath: path)
//
//                    print("Ball Button Tapped")
//                    do {
//                        let sound = try AVAudioPlayer(contentsOf: hornUrl)
//                        self.hornSoundEffect = sound
//                        sound.play()
//
//
//                    } catch {
//                        // couldn't load file D:
//                    }
                    self.playHornSound()
                }
            case "white":
                if lockerState == 1 {
                startOne = true
                self.sil_down_white.alpha = 0.0
                self.sil_up_white.alpha = 1.0
                self.checkPlayerStart()
                }
            case "red":
                if lockerState == 1 {
                startTwo = true
                self.sil_down_red.alpha = 0.0
                self.sil_up_red.alpha = 1.0
                self.checkPlayerStart()
                }
            case "blue":
                if lockerState == 1 {
                startThree = true
                self.sil_down_blue.alpha = 0.0
                self.sil_up_blue.alpha = 1.0
                self.checkPlayerStart()
                }
            case "silver":
                if lockerState == 1 {
                startFour = true
                self.sil_down_silver.alpha = 0.0
                self.sil_up_silver.alpha = 1.0
                self.checkPlayerStart()
                }
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

            //This block tracks players as they finish their round
                
            case "playerOneDone":
                playerOneComplete = true
                
            case "playerTwoDone":
                playerTwoComplete = true
                
            case "playerThreeDone":
                playerThreeComplete = true
                
            case "playerFourDone":
                playerFourComplete = true
                
                
                //This block checks valid answers during the game
                
            case "gameReset":
                self.resetGame()
               
                
            case "1_1":
                if self.myCurrentAnswer == "1_1"{
                    
                    //self.colorService.sendColor("playChime1")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
                
            case "1_2":
                if self.myCurrentAnswer == "1_2"{
                   // self.colorService.sendColor("playChime1")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "1_3":
                if self.myCurrentAnswer == "1_3"{
                    //self.colorService.sendColor("playChime1")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "1_4":
                
                print("Got color 1_4.  - Locker view - myCurrentAnswer is:", self.myCurrentAnswer)
                
                if self.myCurrentAnswer == "1_4" {
                    //self.colorService.sendColor("playChime1")
                    self.advancePrompt()
                    self.resetProgState()
                
                    
                }
                
            case "1_5":
                
                if self.myCurrentAnswer == "1_5"{
                    //self.colorService.sendColor("playChime1")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "1_6":
            
                    if self.myCurrentAnswer == "1_6"{
                     //   self.colorService.sendColor("playChime1")
                        self.advancePrompt()
                        self.resetProgState()
                    }

                
            case "2_1":
                
                if self.myCurrentAnswer == "2_1"{
                    //self.colorService.sendColor("playChime2")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "2_2":
                if self.myCurrentAnswer == "2_2"{
                    //self.colorService.sendColor("playChime2")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
                
            case "2_3":
                
                if self.myCurrentAnswer == "2_3"{
                    //self.colorService.sendColor("playChime2")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "2_4":
                if self.myCurrentAnswer == "2_4"{
                    //self.colorService.sendColor("playChime2")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "2_5":
                if self.myCurrentAnswer == "2_5"{
                    //self.colorService.sendColor("playChime2")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "2_6":
                if self.myCurrentAnswer == "2_6"{
                    //self.colorService.sendColor("playChime2")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "3_1":
                if self.myCurrentAnswer == "3_1"{
                    //self.colorService.sendColor("playChime3")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "3_2":
                if self.myCurrentAnswer == "3_2"{
                    //self.colorService.sendColor("playChime3")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "3_3":
                if self.myCurrentAnswer == "3_3"{
                    //self.colorService.sendColor("playChime3")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "3_4":
                if self.myCurrentAnswer == "3_4"{
                    //self.colorService.sendColor("playChime3")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "3_5":
                if self.myCurrentAnswer == "3_5"{
                    //self.colorService.sendColor("playChime3")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "3_6":
                if self.myCurrentAnswer == "3_6"{
                    //self.colorService.sendColor("playChime3")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "4_1":
                if self.myCurrentAnswer == "4_1"{
                    ////self.colorService.sendColor("playChime4")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "4_2":
                if self.myCurrentAnswer == "4_2"{
                    ////self.colorService.sendColor("playChime4")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "4_3":
                if self.myCurrentAnswer == "4_3"{
                    ////self.colorService.sendColor("playChime4")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "4_4":
                if self.myCurrentAnswer == "4_4"{
                    //self.colorService.sendColor("playChime4")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
                
            case "4_5":
                if self.myCurrentAnswer == "4_5"{
                    //self.colorService.sendColor("playChime4")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
            case "4_6":
                if self.myCurrentAnswer == "4_6"{
                    //self.colorService.sendColor("playChime4")
                    self.advancePrompt()
                    self.resetProgState()
                }
                
                //setting up the right answers dynamically
                
            case "*1 - 1_1":
                print("Received *1 - 1_1")
                if self.myGlobalPlayerNum == 1 {
                    self.myLocalAnswer = "1_1"
                }
                
            case "*1 - 1_2":
                 print("Received *1 - 1_2")
                if self.myGlobalPlayerNum == 1 {
                    self.myLocalAnswer = "1_2"
                }
                
            case "*1 - 1_3":
                 print("Received *1 - 1_3")
                if self.myGlobalPlayerNum == 1 {
                    self.myLocalAnswer = "1_3"
                }
                
            case "*1 - 1_4":
                 print("Received *1 - 1_4")
                if self.myGlobalPlayerNum == 1 {
                    self.myLocalAnswer = "1_4"
                }
                
            case "*1 - 1_5":
                 print("Received *1 - 1_5")
                if self.myGlobalPlayerNum == 1 {
                    self.myLocalAnswer = "1_5"
                }
                
            case "*1 - 1_6":
                 print("Received *1 - 1_6")
                if self.myGlobalPlayerNum == 1 {
                    self.myLocalAnswer = "1_6"
                }
                
            case "*2 - 2_1":
                 print("Received *2 - 2_1")
                if self.myGlobalPlayerNum == 2 {
                    self.myLocalAnswer = "2_1"
                }
                
            case "*2 - 2_2":
                 print("Received *2 - 2_2")
                if self.myGlobalPlayerNum == 2 {
                    self.myLocalAnswer = "2_2"
                }
                
            case "*2 - 2_3":
                 print("Received *2 - 2_3")
                if self.myGlobalPlayerNum == 2 {
                    self.myLocalAnswer = "2_3"
                }
                
            case "*2 - 2_4":
                 print("Received *2 - 2_4")
                if self.myGlobalPlayerNum == 2 {
                    self.myLocalAnswer = "2_4"
                }
                
            case "*2 - 2_5":
                 print("Received *2 - 2_5")
                if self.myGlobalPlayerNum == 2 {
                    self.myLocalAnswer = "2_5"
                }
                
            case "*2 - 2_6":
                 print("Received *2 - 2_6")
                if self.myGlobalPlayerNum == 2 {
                    self.myLocalAnswer = "2_6"
                }
                
            case "*3 - 3_1":
                print("Received *3 - 3_1")
                if self.myGlobalPlayerNum == 3 {
                    self.myLocalAnswer = "3_1"
                }
                
            case "*3 - 3_2":
                print("Received *3 - 3_2")
                if self.myGlobalPlayerNum == 3 {
                    self.myLocalAnswer = "3_2"
                }
                
            case "*3 - 3_3":
                print("Received *3 - 3_3")
                if self.myGlobalPlayerNum == 3 {
                    self.myLocalAnswer = "3_3"
                }
                
            case "*3 - 3_4":
                print("Received *3 - 3_4")
                if self.myGlobalPlayerNum == 3 {
                    self.myLocalAnswer = "3_4"
                }
                
            case "*3 - 3_5":
                print("Received *3 - 3_5")
                if self.myGlobalPlayerNum == 3 {
                    self.myLocalAnswer = "3_5"
                }
                
            case "*3 - 3_6":
                print("Received *3 - 3_6")
                if self.myGlobalPlayerNum == 3 {
                    self.myLocalAnswer = "3_6"
                }
                
            case "*4 - 4_1":
                print("Received *4 - 4_1")
                if self.myGlobalPlayerNum == 4 {
                    self.myLocalAnswer = "4_1"
                }
                
            case "*4 - 4_2":
                print("Received *4 - 4_2")
                if self.myGlobalPlayerNum == 4 {
                    self.myLocalAnswer = "4_2"
                }
                
            case "*4 - 4_3":
                print("Received *4 - 4_3")
                if self.myGlobalPlayerNum == 4 {
                    self.myLocalAnswer = "4_3"
                }
                
            case "*4 - 4_4":
                print("Received *4 - 4_4")
                if self.myGlobalPlayerNum == 4 {
                    self.myLocalAnswer = "4_4"
                }
                
            case "*4 - 4_5":
                print("Received *4 - 4_5")
                if self.myGlobalPlayerNum == 4 {
                    self.myLocalAnswer = "4_5"
                }
                
            case "*4 - 4_6":
                print("Received *4 - 4_6")
                if self.myGlobalPlayerNum == 4 {
                    self.myLocalAnswer = "4_6"
                }
                
            default:
                NSLog("%@", "LVC - Unknown color value received: \(colorString)")
            }
            
        }
                
                
        
            }
        }



