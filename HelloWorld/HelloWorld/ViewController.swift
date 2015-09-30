//
//  ViewController.swift
//  HelloWorld
//
//  Created by Ron Oppenheimer on 9/28/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerCount = 60
    var timerRunning = false
    var timer = NSTimer()

    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var timerLabel: UILabel!
    func Counting() {
        if timerCount > 0 {
        timerCount -= 1
        timerLabel.text = "\(timerCount)"
        }
        
    }
    
    
    @IBAction func startButton(sender: UIButton) {
        if timerRunning == false
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
            timerRunning = true
        }
    }

    @IBAction func stopButton(sender: UIButton) {
        if timerRunning == true
        {
            timer.invalidate()
            timerRunning = false
        }
    }
    
    @IBAction func restartButton(sender: UIButton) {
        timerCount = 60
        timerLabel.text = "60"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func helloWorldAction(nameTextField: UITextField) {
        nameLabel.text = "Hi \(nameTextField.text!)"
    }

}

