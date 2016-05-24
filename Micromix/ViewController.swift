//
//  ViewController.swift
//  Micromix
//
//  Created by Gabo Lugo on 5/23/16.
//  Copyright © 2016 Inspectezr. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    let rootRef = FIRDatabase.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let sectionRef = rootRef.child("sections")
        
        sectionRef.observeEventType(.Value) { (snap: FIRDataSnapshot) in
            
            dump(snap.childrenCount)
            
            
            // snap.value?.description
        }
    }


}

