//
//  DashboardViewController.swift
//  Dashboard
//
//  Created by Austin Blaser on 9/26/21.
//

import UIKit
import Combine

class DashboardViewController: UIViewController {
    var dashboardView: DashboardView {
        guard let unwrappedView = self.view as? DashboardView else {
            fatalError("No view!")
        }
        return unwrappedView
    }
    
    var viewModel: DashboardViewModel?
    private var cancellables: Set<AnyCancellable> = []
    
    required convenience init(viewModel: DashboardViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func loadView() {
        self.view = DashboardView()
    }
    
    override func viewDidLoad() {
        bindViewModel()
    }
    
    func bindViewModel() {
        viewModel?.$backgroundColor.sink(receiveValue: { color in
            self.dashboardView.backgroundColor = color
        }).store(in: &cancellables)
        
        viewModel?.$amountLabelText.sink(receiveValue: { value in
            self.dashboardView.amountLabel.text = value
        }).store(in: &cancellables)
        
        viewModel?.$amountDescriptionText.sink(receiveValue: { description in
            self.dashboardView.amountDescriptionLabel.text = description
        }).store(in: &cancellables)
        
        viewModel?.$cardBackgroundColor.sink(receiveValue: { color in
            self.dashboardView.containerView.backgroundColor = color
        }).store(in: &cancellables)
        
        viewModel?.$cardBorderColor.sink(receiveValue: { color in
            self.dashboardView.containerView.layer.borderColor = color.cgColor
        }).store(in: &cancellables)
        
        viewModel?.$cardBorderRadius.sink(receiveValue: { radius in
            self.dashboardView.containerView.layer.cornerRadius = radius
        }).store(in: &cancellables)
        
        viewModel?.$navbarTitle.sink(receiveValue: { title in
            self.title = title
        }).store(in: &cancellables)
        
        viewModel?.$detailButtonBackgroundColor.sink(receiveValue: { color in
            self.dashboardView.accountDetailsButton.backgroundColor = color
        }).store(in: &cancellables)
        
        viewModel?.$detailButtonTitle.sink(receiveValue: { value in
            self.dashboardView.accountDetailsButton.setTitle(value, for: .normal)
        }).store(in: &cancellables)
        
        viewModel?.$detailButtonRadius.sink(receiveValue: { radius in
            self.dashboardView.accountDetailsButton.layer.cornerRadius = radius
        }).store(in: &cancellables)
        
        self.dashboardView.accountDetailsButton.addTarget(self, action: #selector(goToDetailScreen), for: .touchUpInside)
        
    }
    
    @objc func goToDetailScreen() {
        viewModel?.goToDetailScreen(vc: self)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
}
