//
//  DashboardViewModel.swift
//  Dashboard
//
//  Created by Austin Blaser on 9/26/21.
//

import UIKit
import Combine

class DashboardViewModel: ObservableObject {
    @Published
    var navbarTitle: String = "Welcome"
    
    @Published
    var backgroundColor: UIColor = .systemGroupedBackground
    
    @Published
    var cardBackgroundColor: UIColor = .systemBackground
    
    @Published
    var cardBorderColor: UIColor = .lightGray
    
    @Published
    var cardBorderRadius: CGFloat = 4.0
    
    @Published
    var amountLabelText: String = "$592.81"
    
    @Published
    var amountDescriptionText: String = "in your account"
    
    @Published
    var detailButtonBackgroundColor: UIColor = .systemBlue
    
    @Published
    var detailButtonTitle: String = "Account Details"
    
    @Published
    var detailButtonRadius: CGFloat  = 4.0
    
    func goToDetailScreen(vc: UIViewController?) {
        if let _ = vc  {
            let viewModel = DetailViewModel()
            let detailVC = DetailViewController(viewModel: viewModel)
            detailVC.modalTransitionStyle = .coverVertical
            detailVC.modalPresentationStyle = .fullScreen
            vc?.show(detailVC, sender: self)
        }
    }
}
