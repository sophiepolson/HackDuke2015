//
//  NewUser.swift
//  TutorMeTutorU
//
//  Created by Blake Kaplan on 11/7/15.
//  Copyright © 2015 Blake Kaplan. All rights reserved.
//
import UIKit

class NewUser: UIViewController {
 
    var myFirebase = Firebase(url:"https://tutormetutoru.firebaseio.com");
    
    @IBOutlet weak var myFirstName: UITextField!
    @IBOutlet weak var myLastName: UITextField!
    @IBOutlet weak var myPhoneNumber: UITextField!
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    
    
    @IBAction func makeUser(sender: AnyObject) {
        
        if myFirstName.text!.isEmpty || myLastName.text!.isEmpty || myPhoneNumber.text!.isEmpty || myEmail.text!.isEmpty || myPassword.text!.isEmpty{
            var alert = UIAlertController(title: "Error", message: "You must fill in all information", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        myFirebase.createUser(myEmail.text, password: myPassword.text,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    print("It didn't work");
                    var alert = UIAlertController(title: "Error", message: "You already have an account", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                } else {
                    let uid = result["uid"] as? String
                    
                    var information = ["first_name" : self.myFirstName.text!,
                        "last_name" : self.myLastName.text!,
                        "phone_number" : self.myPhoneNumber.text!,
                        "email" : self.myEmail.text!,
                        "password" : self.myPassword.text!,
                        "credits" : 50]
                    
                    self.myFirebase.childByAppendingPath(uid).setValue(information)
                    
                    print("Successfully created user account with uid: \(uid)")
                    
                }
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
}