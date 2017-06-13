//
//  errors.swift
//  ParkPassGenerator
//
//  Created by Kalvin Bunn on 6/10/17.
//  Copyright © 2017 Bunnana. All rights reserved.
//

import Foundation

//error codes for missing users info that IS required
enum MissingPersonInfo: Error {
    case firstName
    case lastName
    case streetAddress
    case city
    case state
    case zip
    case dateOfBirth
    case ssNumber
}
