//
//  BaseNavigationController.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import UIKit

extension UINavigationController {
    
    func setupCustomNavigationBarAppearance(backgroundColor: UIColor, titleColor: UIColor, largeTitleColor: UIColor? = nil, titleFont: UIFont,
                                            largeTitleFont: UIFont? = nil, tintColor: UIColor? = nil, backItemTitle: String? = nil) {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        appearance.titleTextAttributes = [
            .foregroundColor: titleColor,
            .font: titleFont
        ]

        if let largeTitleColor = largeTitleColor, let largeTitleFont = largeTitleFont {
            appearance.largeTitleTextAttributes = [
                .foregroundColor: largeTitleColor,
                .font: largeTitleFont
            ]
        } else {
            appearance.largeTitleTextAttributes = [
                .foregroundColor: largeTitleColor ?? titleColor,
                .font: largeTitleFont ?? titleFont
            ]
        }

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance

        if let tintColor = tintColor {
            navigationBar.tintColor = tintColor
        }

        if let backItemTitle = backItemTitle {
            navigationItem.backButtonTitle = backItemTitle
        }
    }
    
}
