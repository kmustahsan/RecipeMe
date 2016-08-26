//
//  ViewController.swift
//  RecipeMe
//
//  Created by macbookair11 on 8/25/16.
//  Copyright © 2016 macbookair11. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!){
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"], fromViewController: self) { (facebook: FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
            if facebookError != nil {
                print ("Facebook Login Failed. Error \(facebookLogin)")
            }
            else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print ("Success. Token: \(accessToken)")
                
                let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
                    
                    if error != nil {
                        print("Login error. Log \(error)")
                    }
                    else {
                        print("Logged in. Credential \(credential)")
                        NSUserDefaults.standardUserDefaults().setValue(user?.uid, forKey: KEY_UID)
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    }
                })
                
                
            }
        }
    }
    
    @IBAction func attemptLogin(sender: UIButton!) {
        
        if let email = emailField.text where email != "", let password = passwordField.text where password != "" {
            FIRAuth.auth()!.signInWithEmail(email, password: password, completion: { (authUser, error) in
                if error  != nil {
                    print(error)
                    if error!.code == STATUS_ACCOUNT_NOT_FOUND {
                        FIRAuth.auth()?.createUserWithEmail(email, password: password, completion: { (result, error) in
                            if error != nil {
                                self.showErrorAlert("Could not create account", msg: "Problem creating account")
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(result?.uid, forKey: KEY_UID)
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                                print("saved")
                            }
                        })
                    } else {
                        print("EMAIL \(email)")
                        print ("PASS \(password)")
                        self.showErrorAlert("Email and Password Required", msg: "You must enter an email and password")
                    }
                }
                else {
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
            })
        } else {
            showErrorAlert("Email and Password Required", msg: "You must enter an email and password")
        }
    }
    
    func showErrorAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }



}

