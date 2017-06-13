//
//  Person.swift
//  ParkPassGenerator
//
//  Created by Kalvin Bunn on 6/10/17.
//  Copyright © 2017 Bunnana. All rights reserved.
//

import Foundation

struct Person {
    var firstName: String?
    var lastName: String?
    var street: String?
    var city: String?
    var state: String?
    var zip: String?
    var dateOfBirth: String?
    var ssNumber: String?
    
    var fullName: String {
        return (firstName != nil ? firstName! + " " : "" ) + (lastName != nil ? lastName! : "" )
    }
    var fullAddress: String {
        return (street != nil ? street! + ", " : "") + (city != nil ? city! + ", " : "") + (state != nil ? state! + " " : "") + (zip != nil ? zip! : "")
    }
}

