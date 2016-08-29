//
//  HomeFeedViewController.swift
//  RecipeMe
//
//  Created by Kevin Duong on 7/25/16.
//  Copyright © 2016 Kashif Mustahsan. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var PopUpVC: PopUpViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PopUpVC = self.storyboard?.instantiateViewControllerWithIdentifier("FilterPopUp") as! PopUpViewController
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onFilterClicked(sender: AnyObject) {
        //        if (self.presentedViewController == nil) {
        if (PopUpVC.view.window == nil) {
            self.addChildViewController(PopUpVC)
            //            PopUpVC.view.frame = self.view.frame
            self.view.addSubview(PopUpVC.view)
            PopUpVC.didMoveToParentViewController(self)
            PopUpVC.showAnimate()
            //            opened = true
        }
        else {
            PopUpVC.removeAnimate()
        }
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
