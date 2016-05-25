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
    
    var sections = [Section]()

    @IBOutlet weak var stageTable: UITableView!
    let rootRef = FIRDatabase.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let sectionRef = rootRef.child("sections")
        
        
        sectionRef.observeEventType(.Value) { (snapshot: FIRDataSnapshot) in
            
            self.sections = []
            
            if snapshot.value is NSNull {
                print("There's nothing bro!")
                
            } else {
                
                for item in snapshot.children {
                    
                    let newSection = Section(snapshot: item as! FIRDataSnapshot)
                    
                    self.sections.append(newSection)
                    
                    
                }
                
                self.stageTable.reloadData()
                print(self.sections.count)
                

            }
            
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        
        let i = indexPath.row
        
        cell!.textLabel?.text = sections[i].name

        return cell!
        
    }
    

    
}

