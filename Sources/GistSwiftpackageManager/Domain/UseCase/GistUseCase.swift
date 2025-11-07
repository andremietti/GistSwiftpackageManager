//
//  GistUseCase.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 14/04/25.
//

import Foundation
import Combine
import Networking

class GistUseCase: GistUseCaseProtocol {
    
    private var serviceManager: NetworkManagerProtocol
    @Published var gistList: GistList?
    @Published var gistError: String = String()
    private var cancellables = Set<AnyCancellable>()
    
    init(serviceManager: NetworkManagerProtocol = NetworkService()) {
        self.serviceManager = serviceManager
    }
    
    func getGistList() {
        serviceManager.request(endPoint: APIEndPoint.publicGists, type: GistList.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    debugPrint("Finished")
                case .failure(let error):
                    self?.gistError = error.debugDescription
                    debugPrint("Finish with error: \(error.debugDescription)")
                }
            } receiveValue: { [weak self] list in
                self?.gistList = list
                
            }
            .store(in: &cancellables)
    }
    
    func loadNextPage(page: Int) {
        var endPoint = APIEndPoint.publicGists
        endPoint.setParam(params: ["page" :"\(page)"])
        serviceManager.request(endPoint: endPoint, type: GistList.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    debugPrint("Finished")
                case .failure(let error):
                    self?.gistError = error.debugDescription
                }
            } receiveValue: { [weak self] list in
                self?.gistList = list
                
            }
            .store(in: &cancellables)
    }
    
}
