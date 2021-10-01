//
//  AccountData.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/30/21.
//

import Foundation

class AccountData {
    
    func getAccountData(completion: @escaping (Result<AccountDetail,Error>) -> Void ) {
        
        if let url = Bundle.main.url(forResource: "AccountData", withExtension: "json") {
            let decoder = JSONDecoder()
            
            do {
               let data = try Data(contentsOf: url)
                let accountData = try decoder.decode(AccountDetail.self, from: data)
                completion(.success(accountData))
               
            } catch let error {
                print("❌ Error Decoding Data: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
}
