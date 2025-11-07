//
//  MainFactory.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import Foundation
import UIKit

final class MainFactory {
    
    func makeHomeListViewController(coordinator: HomeCoordinatorDelegate) -> HomeListViewController {
        return HomeListViewController(viewModel: HomeListViewModel(), coordinator: coordinator as HomeCoordinatorDelegate)
    }
    
    func makeDetailViewController(coordinator: MainCoordinator, gist: Gist) -> DetailViewController {
        return DetailViewController(viewModel: DetailViewModel(gist: gist))
    }
}
