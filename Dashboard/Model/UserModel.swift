//
//  UserModel.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/30/21.
//

import Foundation

struct User: Codable {
    let name: String
    let accountCreated: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case accountCreated = "account_created"
    }
}
