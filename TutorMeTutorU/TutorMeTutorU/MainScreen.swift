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
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
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
            self.credits = snapshot.value.valueForKey("credits") as! Int
            self.welcomeMessage.text = "Welcome " + self.firstName
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
}

