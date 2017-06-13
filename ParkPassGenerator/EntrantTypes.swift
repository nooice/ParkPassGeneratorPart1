//
//  guestTypes.swift
//  ParkPassGenerator
//
//  Created by Kalvin Bunn on 6/10/17.
//  Copyright © 2017 Bunnana. All rights reserved.
//

import Foundation

//area access to the amusement park
enum AreaAccess {
    case amusementArea
    case kitchenArea
    case rideControlArea
    case maintenanceArea
    case officeArea
}

//guest type to help make discounts and rides access easy to set up
enum GuestType {
    case classicGuest
    case vipGuest
    case childGuest
    
    
    var foodDiscount: Int {
        switch self {
        case .vipGuest:
            return 10
        default:
            return 0
        }
    }
    
    var merchandiseDiscount: Int {
        switch self {
        case .vipGuest:
            return 20
        default:
            return 0
        }
    }
    var canSkip: Bool {
        switch self {
        case .vipGuest:
            return true
        default:
            return false
        }
    }
}

//employee types. similar use as guest type
enum EmployeePosition {
    case foodServices
    case rideServices
    case maintenance
    case manager
    
    var foodDiscount: Int {
        switch self {
        case .manager:
            return 25
        default:
            return 15
        }
    }
    var merchandiseDiscount: Int {
        return 25
    }
    //appends different access to tempArray var based on position
    var areaAccess: [AreaAccess] {
        var tempArray: [AreaAccess] = [.amusementArea]
        switch self {
        case .foodServices:
            tempArray.append(.kitchenArea)
        case .rideServices:
            tempArray.append(.rideControlArea)
        case .maintenance:
            tempArray.append(.kitchenArea)
            tempArray.append(.rideControlArea)
            tempArray.append(.maintenanceArea)
        case .manager:
            tempArray.append(.kitchenArea)
            tempArray.append(.rideControlArea)
            tempArray.append(.maintenanceArea)
            tempArray.append(.officeArea)
        }
        return tempArray
    }
}
//basic manager tier. can be used to expand customization of managers
enum ManagerTier {
    case shiftManager
    case generalManager
    case seniorManager
}

//based layout for average entrant
protocol Entrant {
    var person: Person { get }
    var canAccessRides: Bool { get set }
    var areaAccess: [AreaAccess] { get set }
}

