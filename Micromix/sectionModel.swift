//
//  sectionModel.swift
//  Micromix
//
//  Created by Gabo Lugo on 5/24/16.
//  Copyright © 2016 Inspectezr. All rights reserved.
//

import Foundation

class Section {
    
    let id: NSString
    let level: NSNumber
    let name: NSString
    let color: NSString
    
    init(level: NSNumber, name: NSString, color: NSString) {
        self.id = NSUUID().UUIDString
        self.level = level
        self.name = name
        self.color = color
    }
    
}