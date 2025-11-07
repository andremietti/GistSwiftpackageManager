//
//  MainCoordinator.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 11/04/25.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var factory: MainFactory
    
    init(navigationController: UINavigationController, factory: MainFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() -> UINavigationController {
        navigationController.setViewControllers([factory.makeHomeListViewController(coordinator: self)], animated: true)
        return navigationController
    }
    
    func didShowDetail(gist: Gist) {
        navigationController.pushViewController(factory.makeDetailViewController(coordinator: self, gist: gist), animated: true)
    }
}
