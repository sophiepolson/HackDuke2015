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
    
    var myFirebase = Firebase(url:"https://tutormetutoru.firebaseio.com");

    @IBAction func login(sender: AnyObject) {
        myFirebase.authUser(username.text, password: password.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    print("WRONG")
                } else {
                     print("YAY")
                }
        })}
    
    func addUsers(){
        myFirebase.createUser("blakejkaplan@gmail.com", password: "password",
            withValueCompletionBlock: { error, result in
                if error != nil {
                    print("It didn't work");
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addUsers()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

