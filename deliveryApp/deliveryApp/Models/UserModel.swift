//
//  UserModel.swift
//  deliveryApp
//
//  Created by Vladut Mihai Poncea on 20.04.2022.
//

import Foundation

struct User: Identifiable, Equatable, Codable {
    var id: String = UUID().uuidString
    
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let email: String
}
