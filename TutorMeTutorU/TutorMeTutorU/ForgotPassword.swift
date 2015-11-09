//
//  ForgotPassword.swift
//  TutorMeTutorU
//
//  Created by Sophie Polson on 11/8/15.
//  Copyright © 2015 Blake Kaplan. All rights reserved.
//

import UIKit

class ForgotPassword: UIViewController {
    
    var myFirebase = Firebase(url: "https://tutormetutoru.firebaseio.com");
    
    @IBOutlet weak var emailAddress: UITextField!
    
    @IBAction func sendEmail(sender: AnyObject) {
        myFirebase.resetPasswordForUser(emailAddress.text, withCompletionBlock: { error in
            if error != nil {
                var alert = UIAlertController(title: "Unknown email", message: "This email does not have an account. Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                print("NO")
            } else {
                var alert = UIAlertController(title: "Email sent", message: "Please check your email for instructions to reset your password.", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                print("email sent")
            }
        })

    }
}
