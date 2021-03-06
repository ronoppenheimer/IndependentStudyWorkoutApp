//
//  restViewController.swift
//  HelloWorld
//
//  Created by Students on 11/13/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit
import AVFoundation

class restViewController: UIViewController {

    var timerCount = 7
    var timerRunning = true
    var timer = NSTimer()
    
    var three: AVAudioPlayer?
    var two: AVAudioPlayer?
    var one: AVAudioPlayer?
    var rest: AVAudioPlayer?
    var nextUp: AVAudioPlayer?
    var curvedLegsCrunch: AVAudioPlayer?
    var heelRaises: AVAudioPlayer?
    var jackKnife: AVAudioPlayer?
    var legRaise: AVAudioPlayer?
    var lunges: AVAudioPlayer?
    var plankHold: AVAudioPlayer?
    var pushUps: AVAudioPlayer?
    var runningInPlace: AVAudioPlayer?
    var russianTwist: AVAudioPlayer?
    var scissors: AVAudioPlayer?
    var sideCrunch: AVAudioPlayer?
    var squats: AVAudioPlayer?
    var tuckedVUps: AVAudioPlayer?
    var vUps: AVAudioPlayer?
    var windshieldWiper: AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer()
        // Do any additional setup after loading the view, typically from a nib.
        progressBar.setProgress(0, animated: true)
        rest?.play()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func Timer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        playSound()
    }
    
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var nextUpLabel: UILabel!
    
    @IBOutlet var timerLabel: UILabel!
    func Counting() {
        if timerCount > 0 {
            timerCount -= 1
            timerLabel.text = "\(timerCount + 1)"
            if timerCount == 5
            {
                nextUp?.play()
            }
            if timerCount == 4 {
                if nextUpLabel.text == "Next Up: Scissors"{
                    scissors?.play()
                }
                if nextUpLabel.text == "Next Up: Curved Legs Crunch"{
                    curvedLegsCrunch?.play()
                }
                if nextUpLabel.text == "Next Up: Leg Raise"{
                    legRaise?.play()
                }
                if nextUpLabel.text == "Next Up: Side Crunch"{
                    sideCrunch?.play()
                }
                if nextUpLabel.text == "Next Up: Windshield Wiper"{
                    windshieldWiper?.play()
                }
                if nextUpLabel.text == "Next Up: Tucked V-Ups"{
                    tuckedVUps?.play()
                }
                if nextUpLabel.text == "Next Up: Russian Twist"{
                    russianTwist?.play()
                }
                if nextUpLabel.text == "Next Up: Plank Hold"{
                    plankHold?.play()
                }
                if nextUpLabel.text == "Next Up: Squats"{
                    squats?.play()
                }
                if nextUpLabel.text == "Next Up: V-Ups"{
                    vUps?.play()
                }
                if nextUpLabel.text == "Next Up: Running In Place"{
                    runningInPlace?.play()
                }
                if nextUpLabel.text == "Next Up: Lunges"{
                    lunges?.play()
                }
                if nextUpLabel.text == "Next Up: Push-Ups"{
                    pushUps?.play()
                }
                if nextUpLabel.text == "Next Up: Heel Raises"{
                    heelRaises?.play()
                }
            }
            if timerCount == 2 {
                three?.play()
            }
            if timerCount == 1 {
                two?.play()
            }
            if timerCount == 0 {
                one?.play()
            }
            let progressCount = 7 - timerCount
            let fractionalProgress = Float(progressCount) / 7
            let animated = progressCount != 0
            progressBar.setProgress(fractionalProgress, animated: animated)
        }
        else {
           // performSegueWithIdentifier("goToExercise", sender: nil)
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.performSegueWithIdentifier("goToExercise", sender: nil)
            }
        }
    }
    
    
    @IBOutlet var progressBar: UIProgressView!
    
    
    func timerStop() {
        timer.invalidate()
        timerRunning = false
        
    }
    

    
    func playSound() {
        
        // Set the sound file name & extension
        let threeSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("3", ofType: "wav")!)
        let twoSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("2", ofType: "wav")!)
        let oneSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("1", ofType: "wav")!)
        let restSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Rest", ofType: "wav")!)
        let nextUpSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Next Up", ofType: "wav")!)
        let curvedLegsCrunchSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Curved Legs Crunch", ofType: "wav")!)
        let heelRaisesSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Heel Raises", ofType: "wav")!)
        let jackKnifeSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Jack Knife", ofType: "wav")!)
        let legRaiseSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Leg Raise", ofType: "wav")!)
        let lungesSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Lunges", ofType: "wav")!)
        let plankHoldSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Plank Hold", ofType: "wav")!)
        let pushUpsSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Push-Ups", ofType: "wav")!)
        let runningInPlaceSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Running In Place", ofType: "wav")!)
        let russianTwistSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Russian Twist", ofType: "wav")!)
        let scissorsSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Scissors", ofType: "wav")!)
        let sideCrunchSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Side Crunch", ofType: "wav")!)
        let squatsSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Squats", ofType: "wav")!)
        let tuckedVUpsSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Tucked V-Ups", ofType: "wav")!)
        let vUpsSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("V-Ups", ofType: "wav")!)
        let windshieldWiperSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Windshield Wiper", ofType: "wav")!)
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        
        // Play the sound
        let error: NSError?
        do {
            three = try AVAudioPlayer(contentsOfURL: threeSound)
            two = try AVAudioPlayer(contentsOfURL: twoSound)
            one = try AVAudioPlayer(contentsOfURL: oneSound)
            rest = try AVAudioPlayer(contentsOfURL: restSound)
            nextUp = try AVAudioPlayer(contentsOfURL: nextUpSound)
            curvedLegsCrunch = try AVAudioPlayer(contentsOfURL: curvedLegsCrunchSound)
            heelRaises = try AVAudioPlayer(contentsOfURL: heelRaisesSound)
            jackKnife = try AVAudioPlayer(contentsOfURL: jackKnifeSound)
            legRaise = try AVAudioPlayer(contentsOfURL: legRaiseSound)
            lunges = try AVAudioPlayer(contentsOfURL: lungesSound)
            plankHold = try AVAudioPlayer(contentsOfURL: plankHoldSound)
            pushUps = try AVAudioPlayer(contentsOfURL: pushUpsSound)
            runningInPlace = try AVAudioPlayer(contentsOfURL: runningInPlaceSound)
            russianTwist = try AVAudioPlayer(contentsOfURL: russianTwistSound)
            scissors = try AVAudioPlayer(contentsOfURL: scissorsSound)
            sideCrunch = try AVAudioPlayer(contentsOfURL: sideCrunchSound)
            squats = try AVAudioPlayer(contentsOfURL: squatsSound)
            tuckedVUps = try AVAudioPlayer(contentsOfURL: tuckedVUpsSound)
            vUps = try AVAudioPlayer(contentsOfURL: vUpsSound)
            windshieldWiper = try AVAudioPlayer(contentsOfURL: windshieldWiperSound)
            
        } catch let error1 as NSError {
            error = error1
            three = nil
            two = nil
            one = nil
            rest = nil
            nextUp = nil
            curvedLegsCrunch = nil
            heelRaises = nil
            jackKnife = nil
            legRaise = nil
            lunges = nil
            plankHold = nil
            pushUps = nil
            runningInPlace = nil
            russianTwist = nil
            scissors = nil
            sideCrunch = nil
            squats = nil
            tuckedVUps = nil
            vUps = nil
            windshieldWiper = nil
            
        }
        three?.prepareToPlay()
        two?.prepareToPlay()
        one?.prepareToPlay()
        rest?.prepareToPlay()
        nextUp?.prepareToPlay()
        curvedLegsCrunch?.prepareToPlay()
        heelRaises?.prepareToPlay()
        jackKnife?.prepareToPlay()
        legRaise?.prepareToPlay()
        lunges?.prepareToPlay()
        plankHold?.prepareToPlay()
        pushUps?.prepareToPlay()
        runningInPlace?.prepareToPlay()
        russianTwist?.prepareToPlay()
        scissors?.prepareToPlay()
        sideCrunch?.prepareToPlay()
        squats?.prepareToPlay()
        tuckedVUps?.prepareToPlay()
        vUps?.prepareToPlay()
        windshieldWiper?.prepareToPlay()
    }
    
    @IBAction func exitButton(sender: UIButton) {
        timerStop()
        performSegueWithIdentifier("goToHome", sender: nil)
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}