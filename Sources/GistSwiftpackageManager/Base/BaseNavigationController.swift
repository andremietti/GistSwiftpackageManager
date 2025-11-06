//
//  BaseNavigationController.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCustomNavigationBarAppearance(backgroundColor: .white, titleColor: .black, titleFont: .boldSystemFont(ofSize: 20.0))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
}
