//
//  MainFactory.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import Foundation

final class MainFactory {
    
    func makeHomeListViewController(coordinator: MainCoordinator) -> HomeListViewController {
        let homeListViewController = HomeListViewController(viewModel: HomeListViewModel())
        homeListViewController.coordinator = coordinator
        return homeListViewController
    }
    
    func makeDetailViewController(coordinator: MainCoordinator, gist: Gist) -> DetailViewController {
        let detailViewController = DetailViewController(viewModel: DetailViewModel(gist: gist))
        return detailViewController
    }
}
