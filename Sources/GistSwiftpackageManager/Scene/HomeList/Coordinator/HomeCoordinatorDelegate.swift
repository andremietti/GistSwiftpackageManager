//
//  HomeCoordinatorDelegate.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 07/11/25.
//

import Foundation

protocol HomeCoordinatorDelegate: AnyObject {
    func didShowGistDetail(gist: Gist)
}
