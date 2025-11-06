//
//  UIViewControllerExtension.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 11/04/25.
//

import UIKit

extension UIViewController {

    @discardableResult
    func addSceneViewToSafeArea(_ rootView: UIView) -> UIView {
        self.view.addSubview(rootView)
        rootView.constraint {[
            $0.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            $0.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ]}

        return rootView
    }

}
