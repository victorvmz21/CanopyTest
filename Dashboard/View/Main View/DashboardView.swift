//
//  DashboardView.swift
//  Dashboard
//
//  Created by Austin Blaser on 9/26/21.
//

import UIKit
import SnapKit

class DashboardView: UIView {
    let containerView = UIView()
    let amountLabel = UILabel()
    let amountDescriptionLabel = UILabel()
    let accountDetailsButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension DashboardView: CanopyView {
    func configureSubviews() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.borderWidth = 1.0
        addSubview(containerView)
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        amountLabel.textAlignment = .left
        containerView.addSubview(amountLabel)
        
        amountDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        amountDescriptionLabel.textAlignment = .center
        amountDescriptionLabel.font = .systemFont(ofSize: 20.0)
        containerView.addSubview(amountDescriptionLabel)
        
        accountDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        accountDetailsButton.isUserInteractionEnabled = true
        addSubview(accountDetailsButton)
        
    }
    
    func configureConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).inset(36.0)
            make.width.equalToSuperview().multipliedBy(0.66)
            make.centerX.equalToSuperview()
        }
        
        amountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20.0)
            make.centerX.equalToSuperview()
        }
        
        amountDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(4.0)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(20.0)
        }
        
        accountDetailsButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(30.0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.56)
            make.height.equalTo(44)
        }
    }
}
