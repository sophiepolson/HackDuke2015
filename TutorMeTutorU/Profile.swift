//
//  Profile.swift
//  TutorMeTutorU
//
//  Created by Blake Kaplan on 11/8/15.
//  Copyright © 2015 Blake Kaplan. All rights reserved.
//

import UIKit

class Profile: UIViewController {
    
    var myFirebase = Firebase(url:"https://tutormetutoru.firebaseio.com");

    var firstName : String!
    var lastName : String!
    var phoneNumber : String!
    var emailAddress : String!
    var password : String!
    var credits : Int!
    var UID : String!
    
    @IBOutlet weak var myFirstName: UITextField!
    @IBOutlet weak var myLastName: UITextField!
    @IBOutlet weak var myPhoneNumber: UITextField!
    @IBOutlet weak var myEmailAddress: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    @IBOutlet weak var myCredits: UILabel!
    
    @IBAction func save(sender: AnyObject) {
        
        if myFirstName.text!.isEmpty || myLastName.text!.isEmpty || myPhoneNumber.text!.isEmpty || myEmailAddress.text!.isEmpty || myPassword.text!.isEmpty{
            var alert = UIAlertController(title: "Error", message: "You must fill in all information", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        var narrowBase = myFirebase.childByAppendingPath(UID)
        var information = ["first_name" : self.myFirstName.text!,
            "last_name" : self.myLastName.text!,
            "phone_number" : self.myPhoneNumber.text!,
            "email" : self.myEmailAddress.text!,
            "password" : self.myPassword.text!,
            "credits" : self.credits]
        
        myFirebase.changeEmailForUser(emailAddress, password: password, toNewEmail: self.myEmailAddress.text, withCompletionBlock: { error in
                if(error != nil){
                    print("Didn't work")
            }
            else{
                print("It worked")
            }
        })
        
        myFirebase.changePasswordForUser(self.myEmailAddress.text, fromOld: password, toNew: self.myPassword.text, withCompletionBlock: {error in
            
            if error != nil{
                print("Didn't work")
            }
            else{
                print("It worked")
            }
            
        })
        
        narrowBase.setValue(information)
        
    }
    
    override func viewDidLoad() {
        [self.navigationItem.setHidesBackButton(false, animated: false)]
        self.myFirstName.text = self.firstName
        self.myLastName.text = self.lastName
        self.myPhoneNumber.text = self.phoneNumber
        self.myPassword.text = self.password
        self.myEmailAddress.text = self.emailAddress
    }
    
    
}
