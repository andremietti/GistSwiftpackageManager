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
    
    func start() -> UIViewController {
        return factory.makeHomeListViewController(coordinator: self)
    }
    
    func didShowDetail(gist: Gist, in controller: HomeListViewController) {
//        let detailViewController = factory.makeDetailViewController(coordinator: self, gist: gist)
//        navigationController.pushViewController(detailViewController, animated: true)
        
        controller.show(factory.makeDetailViewController(coordinator: self, gist: gist), sender: controller)
    }
}
