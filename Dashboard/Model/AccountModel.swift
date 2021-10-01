//
//  AccountModel.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/30/21.
//

import Foundation

struct Account: Codable {
    let name: String
    let accountLastFour: String
    let dateAdded: String
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case name, type
        case accountLastFour = "account_last_four"
        case dateAdded = "date_added"
    }
}
