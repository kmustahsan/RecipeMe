//
//  PopUpViewController.swift
//  RecipeMe
//
//  Created by Kevin Duong on 7/24/16.
//  Copyright © 2016 Kashif Mustahsan. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    
    @IBOutlet weak var PopUpView: UIView!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.4)
        //        self.showAnimate()
        super.viewDidLoad()
        
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:")
        self.view.addGestureRecognizer(tapRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTap(recognizer:UITapGestureRecognizer) {
        if (!CGRectContainsPoint(self.PopUpView.frame, recognizer.locationInView(self.view)))
        {
            removeAnimate()
        }
    }
    
    func closePopUp() {
        self.view.removeFromSuperview()
    }
    
    func showAnimate() {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0
        UIView.animateWithDuration(0.25, animations: {() -> Void in
            self.view.alpha = 1
            self.view.transform = CGAffineTransformMakeScale(1, 1)
        })
    }
    
    func removeAnimate() {
        UIView.animateWithDuration(0.25, animations: {() -> Void in
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0
            }, completion: {(finished: Bool) -> Void in
                if finished {
                    self.view!.removeFromSuperview()
                }
        })
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
