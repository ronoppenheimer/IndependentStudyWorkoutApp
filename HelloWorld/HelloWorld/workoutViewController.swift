//
//  workoutViewController.swift
//  HelloWorld
//
//  Created by Ron Oppenheimer on 11/26/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit

class workoutViewController: UIViewController {
    var pageIndex: Int!
    var titleText: String!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.workoutLabel.text = self.titleText
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet var workoutLabel: UILabel!


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
