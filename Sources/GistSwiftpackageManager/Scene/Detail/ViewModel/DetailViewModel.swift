//
//  
//  DetailViewModel.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//
//
import Foundation

class DetailViewModel {
    
    // MARK: - Properties
    @Published var gist: Gist?
    
    // MARK: - Setup
    init(gist: Gist) {
        self.gist = gist
    }
    
    
}
