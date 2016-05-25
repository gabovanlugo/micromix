//
//  SectionModel.swift
//  Micromix
//
//  Created by Gabo Lugo on 5/24/16.
//  Copyright © 2016 Inspectezr. All rights reserved.
//

import Foundation
import Firebase

class Section {
    
    let key: String
    let id: String
    let createdAt: String
    let level: Int
    let name: String
    let color: String
    
    // For new creation
    init(level: Int, name: String, color: String) {
        self.key = ""
        self.id = NSUUID().UUIDString
        self.createdAt = NSDate().formattedISO8601
        self.level = level
        self.name = name
        self.color = color
    }
    
    // For assignation
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.value?["key"] as! String
        id = snapshot.value?["id"] as! String
        createdAt = snapshot.value?["createdAt"] as! String
        level = snapshot.value?["level"] as! Int
        name = snapshot.value?["name"] as! String
        color = snapshot.value?["color"] as! String
    }
    
}