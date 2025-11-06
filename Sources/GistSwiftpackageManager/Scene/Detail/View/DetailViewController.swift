//
//  
//  DetailViewController.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//
//
import Foundation
import UIKit
import Combine


class DetailViewController: UIViewController {
        
    // MARK: - Properties
    private let rootView = DetailView()
    private var viewModel: DetailViewModel!
    @Published private var gist: Gist?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - ViewConreoller LifeCycle
    init(viewModel: DetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView.delegate = self
        self.navigationController?.navigationBar.tintColor = .black
        setupObservables()
    }
    
    // MARK: - Setup
    
    override func loadView() {
        super.loadView()
        setupConstraints()
        view.backgroundColor = .black
        self.addSceneViewToSafeArea(rootView)
    }

    private func setupConstraints() {}

    func setupObservables() {
        viewModel.$gist
            .sink { result in
                guard let result = result else {
                    return
                }
                self.gist = result
                self.rootView.setView(gist: result)
                self.navigationItem.title = result.owner.login
            }
            .store(in: &cancellables)
    }

}

// MARK: - DetailViewDelegate
extension DetailViewController: DetailViewDelegate {}
