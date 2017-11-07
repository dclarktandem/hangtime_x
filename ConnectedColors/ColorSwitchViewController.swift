import UIKit
import AVFoundation

class ColorSwitchViewController: UIViewController {
    
    var openingSoundEffect: AVAudioPlayer!
    var hornSoundEffect: AVAudioPlayer!
    
    

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
    
    
    
    @IBOutlet weak var locker_image: UIImageView!
    
    @IBOutlet weak var lockerBall: UIImageView!
    
    @IBAction func lockerBall_Button(_ sender: Any) {
    }
 
    @IBAction func ballTapped_heldDown(_ sender: Any) {
        
        
        
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
        self.sil_down_silver.alpha = 1.0})
        
        // Hi Luke
    
    
    //self.sil_up_white.alpha = 0.0
        //self.sil_up_red.alpha = 0.0
        //self.sil_up_blue.alpha = 0.0
        //self.sil_up_silver.alpha = 0.0
        //self.lockerBall.alpha = 0.0
        
        
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
                        
           setUpLockerView()
    }
    
                 
    }
        
        
    


extension ColorSwitchViewController : ColorServiceManagerDelegate {

    func connectedDevicesChanged(manager: ColorServiceManager, connectedDevices: [String]) {
        OperationQueue.main.addOperation {
            self.connectionsLabel.text = "Connections: \(connectedDevices)"
        }
    }

    func colorChanged(manager: ColorServiceManager, colorString: String) {
        OperationQueue.main.addOperation {
            switch colorString {
            case "red":
                self.change(color: .red)
            case "yellow":
                self.change(color: .yellow)
            default:
                NSLog("%@", "Unknown color value received: \(colorString)")
            }
        }
    }

}
