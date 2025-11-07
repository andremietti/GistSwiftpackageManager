//
//  GistLauncher.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 06/11/25.
//

import Foundation
import UIKit

public final class GistLauncher {
    
    static public func launch() {
        let navigationController = UINavigationController()
        let coordinator: MainCoordinator
        let factory = MainFactory()
        coordinator = MainCoordinator(navigationController: navigationController, factory: factory)
        coordinator.start()
    }
}
