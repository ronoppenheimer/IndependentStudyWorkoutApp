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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBOutlet var nameLabel: UILabel!
    




    @IBAction func helloWorldAction(nameTextField: UITextField) {
        SharingManager.sharedInstance.storedNameLabel = nameTextField.text!
        performSegueWithIdentifier("goToHome", sender: nil)
    }

}

