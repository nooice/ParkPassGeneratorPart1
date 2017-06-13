//
//  Guest.swift
//  ParkPassGenerator
//
//  Created by Kalvin Bunn on 6/10/17.
//  Copyright © 2017 Bunnana. All rights reserved.
//

import Foundation

//guest class set up
class Guest: Entrant {
    var guestType: GuestType
    var person: Person
    var canAccessRides: Bool
    var canSkipRideLine: Bool
    var areaAccess: [AreaAccess]
    
    init(ofType guestType: GuestType,From Person: Person ) throws {
        //check if person is a child guest. **needs to be changed to check if age is under 5
        if guestType == .childGuest{
            guard Person.dateOfBirth != nil else{
                print("missing date of birth")
                throw MissingPersonInfo.dateOfBirth
            }
        }
        
        self.guestType = guestType
        self.person = Person
        self.canAccessRides = true
        self.canSkipRideLine = guestType.canSkip
        self.areaAccess = [.amusementArea]
    }
}

//employee class set up
class HourlyEmployee: Entrant {
    var position: EmployeePosition
    var person: Person
    var canAccessRides: Bool
    var areaAccess: [AreaAccess]
    
    init(fromProfileOf Person: Person, withPostion position: EmployeePosition) throws {
        //required info to be an employee
        guard Person.firstName != nil else{
            print("missing first name")
            throw MissingPersonInfo.firstName
        }
        guard Person.lastName != nil else{
            print("missing last name")
            throw MissingPersonInfo.lastName
        }
        guard Person.street != nil else{
            print("missing street address")
            throw MissingPersonInfo.streetAddress
        }
        guard Person.city != nil else{
            print("missing address city")
            throw MissingPersonInfo.city
        }
        guard Person.state != nil else{
            print("missing address state")
            throw MissingPersonInfo.state
        }
        guard Person.zip != nil else{
            print("missing zip dode")
            throw MissingPersonInfo.zip
        }
        guard Person.ssNumber != nil else{
            print("missing Social Security Number")
            throw MissingPersonInfo.ssNumber
        }
        
        self.position = position
        self.person = Person
        self.canAccessRides = true
        self.areaAccess = position.areaAccess
    }
}

class Manager: HourlyEmployee {
    var managementTier: ManagerTier
    
    override init(fromProfileOf person: Person, withPostion position: EmployeePosition, withManagerPostion managementTier: ManagerTier) throws {
        self.managementTier = managementTier
        try super.init(fromProfileOf: person, withPostion: position)
    }
    
    //used to automatically assign instance of Manager() to position of .manager
    convenience init(){
        position = .manager
    }
}

//i was using the code below to test if the functions were working.

//let kalvin = Person(firstName: "Kalvin", lastName: "Bunn", street: nil, city: nil, state: nil, zip: nil, dateOfBirth: "12/26/1990", ssNumber: nil)
//
//let newPass = try Guest(ofType: .childGuest, From: kalvin)
//
//newPass.areaAccess
