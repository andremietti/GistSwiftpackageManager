//
//  MainFactory.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import Foundation
import UIKit

final class MainFactory {
    
    func makeHomeListViewController(coordinator: MainCoordinator, navigationController: UINavigationController) -> HomeListViewController {
        let homeListViewController = HomeListViewController(viewModel: HomeListViewModel(), coordinator: coordinator)
        navigationController.present(homeListViewController, animated: true)
        return homeListViewController
    }
    
    func makeDetailViewController(coordinator: MainCoordinator, gist: Gist) -> DetailViewController {
        let detailViewController = DetailViewController(viewModel: DetailViewModel(gist: gist))
        return detailViewController
    }
}
