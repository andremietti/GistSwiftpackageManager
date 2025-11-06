//
//  
//  HomeListViewController.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 10/04/25.
//
//

import Foundation
import UIKit
import Combine

class HomeListViewController: UIViewController {
        
    // MARK: - Properties
    private let rootView = HomeListView()
    weak var coordinator: MainCoordinator?
    private var viewModel: HomeListViewModel!
    
    @Published private var gistList: GistList?
    private var cancellables = Set<AnyCancellable>()

    private var isLoading = false


    // MARK: - ViewConreoller LifeCycle
    init(viewModel: HomeListViewModel = HomeListViewModel()) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        self.addSceneViewToSafeArea(rootView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        self.view.backgroundColor = UIColor(red: 40.0/255.0, green: 43.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        navigationItem.backButtonTitle = ""
        self.navigationItem.title = "The Rick and Morty"

        setupObservables()
        loadData()
    }
    
}

// MARK: - Functional methods
extension HomeListViewController {

    // MARK: - Setup
    func setupObservables() {
        viewModel.$gistList
            .sink { results in
                self.gistList = results
                self.rootView.setTableView(gistList: self.gistList)
                self.toggleLoader()
            }
            .store(in: &cancellables)
    }
    
    //MARK: - Fetch data
    func loadData() {
        viewModel.fecthGistList()
    }
    
    //MARK: - Periferal
    func toggleLoader() {
        isLoading = !(gistList?.count ?? .defaultValue > 0)
        if !isLoading {
            rootView.endRefresh()
        }
    }
}


// MARK: - HomeViewDelegate
extension HomeListViewController: HomeViewDelegate {
    func refreshTable() {
        loadData()
    }
    
    func loadMoreData() {
        viewModel.loadMoreContent()
    }
    
    func didTapOnGist(gist: Gist) {
        coordinator?.didShowDetail(gist: gist)
    }
}
