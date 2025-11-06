//
//  UIColorExtension.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 20/10/25.
//

import UIKit

extension UIColor {
    func getStatus(status: StringStatus) -> UIColor {
        switch status {
        case .alive:
            return .green
        case .dead:
            return .red
        case .unknown:
            return .orange
        }
    }
}
