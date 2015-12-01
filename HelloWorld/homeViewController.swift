//
//  homeViewController.swift
//  HelloWorld
//
//  Created by Students on 11/23/15.
//  Copyright © 2015 RonOppenheimer. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UIPageViewControllerDataSource {

    var timerCount = 60
    var timerRunning = false
    var timer = NSTimer()
    var exerciseCount = 0
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pageTitles = NSArray(objects: "8 Minute Abs", "8 Minute Legs")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        var startVC = self.viewControllerAtIndex(0) as workoutViewController
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.width, self.view.frame.size.height - 140)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
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
    
    func viewControllerAtIndex(index: Int) -> workoutViewController
    {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return workoutViewController()
        }
        
        var vc: workoutViewController = self.storyboard?.instantiateViewControllerWithIdentifier("workoutViewController") as! workoutViewController
        
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
        
        
    }
    
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        
        var vc = viewController as! workoutViewController
        var index = vc.pageIndex as Int
        
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! workoutViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index++
        
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
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
