//
//  AccountDetailModel.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/30/21.
//

import Foundation

struct AccountDetail: Codable {
    let user: User
    let accounts: [Account]
}
