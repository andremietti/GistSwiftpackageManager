//
//  Gist.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//

import Foundation

typealias GistList = [Gist]

struct Gist: Decodable {
    var id: String
    var url: String
    var created_at: String
    var updated_at: String
    var description: String
    var owner: Owner
}
