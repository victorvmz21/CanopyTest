//
//  AccountDetailTableViewCell.swift
//  Dashboard
//
//  Created by Victor Monteiro on 9/30/21.
//

import UIKit
import SnapKit

class AccountDetailTableViewCell: UITableViewCell, CanopyView {
    let bankNameLabel = UILabel()
    let labelAccountType = UILabel()
    let dateAddedLabel = UILabel()
    let lastFourLabel = UILabel()

    override func layoutIfNeeded() {
        setupSubviews()
    }

    func configureSubviews() {
        bankNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bankNameLabel)
        
        labelAccountType.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(labelAccountType)
        
        dateAddedLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateAddedLabel)
        
        lastFourLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(lastFourLabel)
    }
    
    func configureConstraints() {
        
        bankNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
        }
        
        lastFourLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        
        dateAddedLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.bottom).inset(5)
            make.trailing.equalToSuperview().inset(20)
        }
        
        labelAccountType.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.bottom).inset(5)
            make.leading.equalToSuperview().inset(20)
        }
    }
    
    func fillCellWith(account: Account) {
        bankNameLabel.text = account.name
        labelAccountType.text = account.type
        lastFourLabel.text = account.accountLastFour
        dateAddedLabel.text = account.dateAdded.formattedDate()
    }

}
