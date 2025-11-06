//
//  CollectionExtension.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 28/04/25.
//


import Foundation

extension Collection {
    var isEmpty: Bool { startIndex == endIndex }
    var isNotEmpty: Bool { !isEmpty }
}

