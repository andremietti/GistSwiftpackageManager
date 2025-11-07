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
        let homeListViewController = factory.makeHomeListViewController()
        homeListViewController.coordinator = self
        navigationController.setViewControllers([factory.makeHomeListViewController()], animated: true)
        return navigationController
    }
    
    func didShowDetail(gist: Gist) {
        navigationController.pushViewController(factory.makeDetailViewController(coordinator: self, gist: gist), animated: true)
    }
}
