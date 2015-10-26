//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ron Oppenheimer on 9/28/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit
//import AVFoundation

class ViewController: UIViewController {
    
    var timerCount = 60
    var timerRunning = false
    var timer = NSTimer()

    //var audioPlayer = AVAudioPlayer()
//    var audioPlayer: AVAudioPlayer
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var timerLabel: UILabel!
    func Counting() {
        if timerCount > 0 {
        timerCount -= 1
        timerLabel.text = "\(timerCount)"
        }
        
    }
    
    func timerStop() {
        timer.invalidate()
        timerRunning = false
        
    }
    
    @IBAction func startButton(sender: UIButton) {
        if timerRunning == false
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
            timerRunning = true
            sender.setTitle("Stop", forState: UIControlState.Normal)
        }
        else
        {
            timerStop()
            sender.setTitle("Start", forState: UIControlState.Normal)
        }
        
    }

    @IBAction func stopButton(sender: UIButton) {
        if timerRunning == true
        {
            //timerStop()
            //sender.setTitle("Start", forState: UIControlState.Normal)
        }
    }

    
    @IBAction func restartButton(sender: UIButton) {
        timerStop()
        timerCount = 60
        timerLabel.text = "60"
    }

    @IBAction func helloWorldAction(nameTextField: UITextField) {
        nameLabel.text = "Hi \(nameTextField.text!)"
    }

}

