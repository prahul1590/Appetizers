//
//  User.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-07.
//

import Foundation

struct User:Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
