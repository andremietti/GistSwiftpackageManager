//
//  UIViewExtension.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 10/04/25.
//

import UIKit

public extension UIView {
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(closure(self))
    }

    func deactiveConstraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.deactivate(closure(self))
    }

    func constraint(to container: UIView, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            self.topAnchor.constraint(equalTo: container.topAnchor, constant: margin),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -margin),
            self.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: margin),
            self.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -margin),
        ]
        NSLayoutConstraint.activate(constraints)
    }

    func constraint(to containerLayoutGuide: UILayoutGuide, margin: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            self.topAnchor.constraint(equalTo: containerLayoutGuide.topAnchor, constant: margin),
            self.bottomAnchor.constraint(equalTo: containerLayoutGuide.bottomAnchor, constant: -margin),
            self.leadingAnchor.constraint(equalTo: containerLayoutGuide.leadingAnchor, constant: margin),
            self.trailingAnchor.constraint(equalTo: containerLayoutGuide.trailingAnchor, constant: -margin),
        ]
        NSLayoutConstraint.activate(constraints)
    }
 
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         layer.mask = mask
     }

}

