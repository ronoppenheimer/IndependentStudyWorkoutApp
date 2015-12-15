//
//  countdownViewController.swift
//  HelloWorld
//
//  Created by Students on 11/9/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit
import AVFoundation

class countdownViewController: UIViewController {

    var timerCount = 5
    var timerRunning = true
    var timer = NSTimer()

    
    var beginWith: AVAudioPlayer?
    var three: AVAudioPlayer?
    var two: AVAudioPlayer?
    var one: AVAudioPlayer?
    var abdominalCrunch: AVAudioPlayer?
    var burpees: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer()
        // Do any additional setup after loading the view, typically from a nib.
        progressBar.setProgress(0, animated: true)
        beginWith?.play()
        
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
            if timerCount == 4 {
                if nextUpLabel.text == "Next Up: Abdominal Crunch"{
                    abdominalCrunch?.play()
                }
                if nextUpLabel.text == "Next Up: Burpees"{
                    burpees?.play()
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
            let progressCount = 5 - timerCount
            let fractionalProgress = Float(progressCount) / 5
            let animated = progressCount != 0
            progressBar.setProgress(fractionalProgress, animated: animated)
        }
        else {
            performSegueWithIdentifier("goToExercise", sender: nil)
        }
    }

    
    @IBOutlet var progressBar: UIProgressView!

    
    func timerStop() {
        timer.invalidate()
        timerRunning = false
        
    }
    
    func playSound() {
        
        // Set the sound file name & extension
        let beginWithSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Begin With", ofType: "wav")!)
        let threeSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("3", ofType: "wav")!)
        let twoSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("2", ofType: "wav")!)
        let oneSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("1", ofType: "wav")!)
        let abdominalCrunchSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Abdominal Crunch", ofType: "wav")!)
        let burpeesSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Burpees", ofType: "wav")!)
        
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
            
            beginWith = try AVAudioPlayer(contentsOfURL: beginWithSound)
            three = try AVAudioPlayer(contentsOfURL: threeSound)
            two = try AVAudioPlayer(contentsOfURL: twoSound)
            one = try AVAudioPlayer(contentsOfURL: oneSound)
            abdominalCrunch = try AVAudioPlayer(contentsOfURL: abdominalCrunchSound)
            burpees = try AVAudioPlayer(contentsOfURL: burpeesSound)
            
        } catch let error1 as NSError {
            error = error1
            
            beginWith = nil
            three = nil
            two = nil
            one = nil
            abdominalCrunch = nil
            burpees = nil
        }
        beginWith?.prepareToPlay()
        three?.prepareToPlay()
        two?.prepareToPlay()
        one?.prepareToPlay()
        abdominalCrunch?.prepareToPlay()
        burpees?.prepareToPlay()
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
