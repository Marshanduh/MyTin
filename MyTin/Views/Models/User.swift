//
//  User.swift
//  MyTin
//
//  Created by Marshanda Gwie on 23/05/24.
//

import Foundation

class User {
    var name: String
    var emailAddress: String
    var phoneNumber: String
    var picture: String

    init(name: String, emailAddress: String, phoneNumber: String, picture: String) {
        self.name = name
        self.emailAddress = emailAddress
        self.phoneNumber = phoneNumber
        self.picture = picture
    }

    
    // Method to edit profile details
//    func editProfile(name: String, emailAddress: String, phoneNumber: String, picture: String) {
//        self.name = name
//        self.emailAddress = emailAddress
//        self.phoneNumber = phoneNumber
//        self.picture = picture
//    }
    
}
