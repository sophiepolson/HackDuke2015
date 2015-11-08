//
//  ViewController.swift
//  TutorMeTutorU
//
//  Created by Blake Kaplan on 11/7/15.
//  Copyright © 2015 Blake Kaplan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var myLogin: UIButton!
    @IBOutlet weak var newUser: UIButton!
    
    var myUid : String!
    
    var myFirebase = Firebase(url:"https://tutormetutoru.firebaseio.com");

    @IBAction func login(sender: AnyObject) {
        myFirebase.authUser(username.text, password: password.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    var alert = UIAlertController(title: "Error", message: "Incorrect Username or Password", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    print("WRONG")
                } else {
                    print("YAY")
                    self.myUid = self.myFirebase.authData.uid
                    self.performSegueWithIdentifier("Jeff", sender: self)
                }
        })}
    
   
    
    func addUsers(){
        myFirebase.createUser("blakejkaplan@gmail.com", password: "password",
            withValueCompletionBlock: { error, result in
                if error != nil {
                    print("It didn't work");
                } else {
                    let uid = result["uid"] as? String
                    self.myUid = uid
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

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Jeff"){
            var svc = segue.destinationViewController as! MainScreen;
            svc.UID = myUid
        }
    }
    
}

