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
    
    override func viewDidLoad() {
        print(UID)
        var narrowBase = self.myFirebase.childByAppendingPath(UID)
        myFirebase.childByAppendingPath(self.UID).observeSingleEventOfType(
            FEventType.Value, withBlock: { (snapshot) -> Void in
                //print(snapshot.valueForKey("first_name"))
                //print(snapshot.children.valueForKey("first_name"))
                //for child in snapshot.children {
                
                    //let childSnapshot = snapshot.childSnapshotForPath(child.key)
                    //let someValue = childSnapshot.value["first_name"] as! String
                    //print(someValue)
                //}
        })
    }
}

