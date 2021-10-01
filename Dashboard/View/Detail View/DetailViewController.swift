//
//  DetailViewController.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/29/21.
//

import UIKit
import Combine

class DetailViewController: UIViewController {
    var detailView: DetailView {
        guard let detailView = self.view as? DetailView else {
            fatalError("View not found!")
        }
        return detailView
    }
    
    var viewModel: DetailViewModel?
    private var cancellables: Set<AnyCancellable> = []
    
    required convenience init(viewModel: DetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    override func loadView() {
        self.view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel?.getAccountData()
    }
    
    func bindViewModel() {
        viewModel?.$backgroundColor.sink(receiveValue: { color in
            self.detailView.backgroundColor = color
            self.detailView.tableView.backgroundColor = color
        }).store(in: &cancellables)
        
        viewModel?.$primaryTintColor.sink(receiveValue: { color in
            self.detailView.userNameLabel.textColor = color
        }).store(in: &cancellables)
        
        viewModel?.$secondaryTintColor.sink(receiveValue: { color in
            self.detailView.customerSinceLabel.textColor = color
        }).store(in: &cancellables)
        
        viewModel?.$accountDetail.sink(receiveValue: { (accountDetail) in
            if let accountDetail = accountDetail {
                self.detailView.accountDetail = accountDetail
                self.detailView.customerSinceLabel.text = "Customer since: \(accountDetail.user.accountCreated.formattedDate())"
                self.detailView.userNameLabel.text = accountDetail.user.name
            }
        }).store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }

}
