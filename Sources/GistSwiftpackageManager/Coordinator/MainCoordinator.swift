//
//  MainCoordinator.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 11/04/25.
//

import UIKit

public class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var factory: MainFactory
    
    init(navigationController: UINavigationController, factory: MainFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    public func start() -> UINavigationController {
        let homeListViewController = factory.makeHomeListViewController(coordinator: self)
        navigationController.setViewControllers([homeListViewController], animated: true)
        return navigationController
    }
    
    func didShowDetail(gist: Gist) {
        navigationController.pushViewController(factory.makeDetailViewController(coordinator: self, gist: gist), animated: true)
    }
}

extension MainCoordinator: HomeCoordinatorDelegate {
    
    func didShowGistDetail(gist: Gist) {
        navigationController.pushViewController(factory.makeDetailViewController(coordinator: self, gist: gist), animated: true)
    }
}
