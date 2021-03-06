//
//  AddNewViewController.swift
//  Micromix
//
//  Created by Gabo Lugo on 5/24/16.
//  Copyright © 2016 Inspectezr. All rights reserved.
//

import UIKit
import Firebase

class AddNewViewController: UIViewController {
    
    let rootRef = FIRDatabase.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var colorField: UITextField!
    
    @IBAction func saveSection(sender: AnyObject) {
        
        let key = rootRef.child("sections").childByAutoId().key
        
        let sectionToSave = Section(level: 1, name: nameField.text!, color: colorField.text!)
        
        let sectionToPost = [
            "key": key,
            "id": sectionToSave.id,
            "createdAt": sectionToSave.createdAt,
            "level": sectionToSave.level,
            "name": sectionToSave.name,
            "color": sectionToSave.color
        ]
        
        
        let childUpdates = ["/sections/\(key)": sectionToPost]
        
        rootRef.updateChildValues(childUpdates)
        
        navigationController?.popViewControllerAnimated(true)

    }
}
