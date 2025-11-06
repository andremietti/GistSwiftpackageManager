//
//  ConfigurableView.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 10/04/25.
//

import UIKit

protocol ConfigurableView: UIView {
    func setupView ()
    func buildViewHierarchy ()
    func setupConstraints ()
}

extension ConfigurableView {
    func setupView () {
        translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
}

