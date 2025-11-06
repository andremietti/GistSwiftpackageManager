//
//  GistUseCaseProtocol.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 14/04/25.
//

import Foundation
import Combine
import Networking

protocol GistUseCaseProtocol {
    func getGistList()
    func loadNextPage(page: Int)
}
