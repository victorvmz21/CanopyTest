//
//  UIHelpers.swift
//  Dashboard
//
//  Created by Austin Blaser on 9/26/21.
//

import UIKit

protocol CanopyView {
    func configureSubviews()
    func configureConstraints()
    
    func setupSubviews()
}

extension CanopyView {
    func setupSubviews() {
        configureSubviews()
        configureConstraints()
    }
}
