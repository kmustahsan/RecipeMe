//
//  TabBarViewController.swift
//  RecipeMe
//
//  Created by Kevin Duong on 7/20/16.
//  Copyright © 2016 Kashif Mustahsan. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //        tabBar.barTintColor = UIColor.whiteColor()
        tabBar.tintColor = UIColor.redColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        let homefeed = UIStoryboard(name: "HomeFeed", bundle: nil)
        
        /* get first screen of the tab and set it as the tab's view controller */
        let homeFirstPage = homefeed.instantiateViewControllerWithIdentifier("FeedNavigationController") as! UINavigationController
        homeFirstPage.tabBarItem.title = "Cookbook"
        homeFirstPage.tabBarItem.image = UIImage(named: "tab-cookbook")
        
        self.viewControllers = [homeFirstPage]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
