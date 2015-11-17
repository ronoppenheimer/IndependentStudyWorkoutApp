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
    var exerciseCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var continueButton: UIButton!




    @IBAction func helloWorldAction(nameTextField: UITextField) {
        nameLabel.text = "Hi \(nameTextField.text!)"
        nameTextField.hidden = true
        continueButton.hidden = false
    }

}

