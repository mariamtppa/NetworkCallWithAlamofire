//
//  ApiResponseDataModel.swift
//  CinchProject
//
//  Created by Mariam on 27/10/2020.
//  Copyright © 2020 Decagon. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let contacts: [Contact]
}

struct Contact: Codable {
    let id, name, email: String
    let address: Address
    let gender: Gender
    let phone: Phone
}

enum Address: String, Codable {
    case xxXxXxxxXStreetXCountry = "xx-xx-xxxx,x - street, x - country"
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

struct Phone: Codable {
    let mobile: Mobile
    let home, office: Home
}

enum Home: String, Codable {
    case the00000000 = "00 000000"
}

enum Mobile: String, Codable {
    case the910000000000 = "+91 0000000000"
}
