//
//  DetailViewModel.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/29/21.
//

import UIKit
import Combine

class DetailViewModel: ObservableObject {
    
    let dataService = AccountData()
    
    @Published
    var accountDetail: AccountDetail?
    
    @Published
    var backgroundColor: UIColor = .systemGroupedBackground
    
    @Published
    var primaryTintColor: UIColor = .systemBlue
    
    @Published
    var secondaryTintColor: UIColor = .lightGray
    
    func getAccountData() {
        dataService.getAccountData { response in
            switch response {
            case .success(let accountDetail):
                self.accountDetail = accountDetail
            case .failure(let error):
                print("Error getting account detail: \(error.localizedDescription)")
            }
        }
    }
}
