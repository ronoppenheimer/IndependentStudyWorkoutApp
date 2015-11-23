//
//  homeViewController.swift
//  HelloWorld
//
//  Created by Students on 11/23/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

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
        self.nameLabel.text = "Hi \(SharingManager.sharedInstance.storedNameLabel!)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "goToHome") {
            
            
        }
    }
    
    
    @IBOutlet var nameLabel: UILabel!
    
    
    @IBOutlet var continueButton: UIButton!
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
