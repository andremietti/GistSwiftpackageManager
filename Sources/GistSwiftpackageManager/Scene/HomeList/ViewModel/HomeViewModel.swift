//
//  
//  HomeListViewModel.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 10/04/25.
//
//
import Foundation
import Combine

class HomeListViewModel {

    // MARK: - Properties
    @Published var gistList: GistList?
//    @Published var resultInfo: ResultInfo?
    @Published var nextPage = 0
    @Published private var useCase: GistUseCase
    private var cancellables = Set<AnyCancellable>()
    private var actualPage: Int = 0
    
    // MARK: - Setup
    init(useCase: GistUseCase = GistUseCase()) {
        self.useCase = useCase
    }
}

//MARK: - Functional methods
extension HomeListViewModel {
    
    func fecthGistList() {
        useCase.getGistList()
        useCase.$gistList
            .sink { model in
                if self.gistList == nil {
                    self.gistList = model
                } else {
                    guard let results = model else { return }
                    self.gistList?.append(contentsOf: results)
                }
                
                if let next = model?.count {
                    self.nextPage = next + 1
                }
            }
            .store(in: &cancellables)
    }
    
    
    func loadMoreContent() {
        useCase.loadNextPage(page: self.nextPage)
        actualPage = nextPage + 1
    }
    
}
