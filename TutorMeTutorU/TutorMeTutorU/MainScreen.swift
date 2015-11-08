//
//  MainScreen.swift
//  TutorMeTutorU
//
//  Created by Blake Kaplan on 11/7/15.
//  Copyright © 2015 Blake Kaplan. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    var myFirebase = Firebase(url:"https://tutormetutoru.firebaseio.com");
    
    var UID : String!
    var firstName : String!
    var lastName : String!
    var phoneNumber : String!
    var emailAddress : String!
    var credits : Int!
    var password : String!
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    @IBAction func profile(sender: AnyObject) {
        self.performSegueWithIdentifier("Mike", sender: self)
    }
    
    
    override func viewDidLoad() {
        [self.navigationItem.setHidesBackButton(true, animated: false)]
        print(UID)
        var narrowBase = self.myFirebase.childByAppendingPath(UID)
        var myName = narrowBase.childByAppendingPath("first_name")
        narrowBase.observeEventType(.Value, withBlock: { snapshot in
            self.firstName = snapshot.value.valueForKey("first_name") as! String
            self.lastName = snapshot.value.valueForKey("last_name") as! String
            self.phoneNumber = snapshot.value.valueForKey("phone_number") as! String
            self.emailAddress = snapshot.value.valueForKey("email") as! String
            print(self.emailAddress)
            self.credits = snapshot.value.valueForKey("credits") as! Int
            self.password = snapshot.value.valueForKey("password") as! String!
            self.welcomeMessage.text = "Welcome " + self.firstName
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Mike"){
            var svc = segue.destinationViewController as! Profile;
            svc.firstName = self.firstName
            svc.lastName = self.lastName
            svc.phoneNumber = self.phoneNumber
            svc.credits = self.credits
            svc.password = self.password
            svc.emailAddress = self.emailAddress
            svc.UID = self.UID
        }
    }

}

