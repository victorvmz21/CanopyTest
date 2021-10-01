//
//  DetailView.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/29/21.
//

import UIKit
import SnapKit

class DetailView: UIView {
    let userNameLabel = UILabel()
    let customerSinceLabel = UILabel()
    let tableView = UITableView()
    
    var accountDetail: AccountDetail?
    let cellIdentifier: String = "cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension DetailView: CanopyView {
    func configureSubviews() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = .systemFont(ofSize: 30.0)
        addSubview(userNameLabel)
        
        customerSinceLabel.translatesAutoresizingMaskIntoConstraints = false
        customerSinceLabel.text = "customer since: Mar 3, 2021"
        customerSinceLabel.font = .systemFont(ofSize: 16.0)
        addSubview(customerSinceLabel)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AccountDetailTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        addSubview(tableView)
    }
    
    func configureConstraints() {
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.equalToSuperview().inset(20)
        }
        
        customerSinceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.userNameLabel.snp.top).inset(36)
            make.leading.equalTo(self.userNameLabel.snp.leading)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(customerSinceLabel.snp.top).inset(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountDetail?.accounts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AccountDetailTableViewCell else {
            return UITableViewCell()
        }
        
        guard let account = accountDetail?.accounts[indexPath.row] else { return UITableViewCell() }
        cell.fillCellWith(account: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
