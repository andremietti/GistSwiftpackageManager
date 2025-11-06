//
//
//  DetailView.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 16/10/25.
//
//

import UIKit

public protocol DetailViewDelegate: AnyObject {}

class DetailView: SceneView {
    
    // MARK: - Properties
    public var delegate: DetailViewDelegate?
    private let containerView = configure(UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var stackView = configure(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 6.0
    }
    
    private var gistImageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFit
        $0.layer.masksToBounds = true
    }
    
    // MARK: - setup
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(gistImageView)
    }
    
    override func setupConstraints() {
        containerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0)
        ]}

        gistImageView.constraint {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0.0),
            $0.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: 0.8),
            $0.heightAnchor.constraint(equalTo: containerView.widthAnchor, constant: 0.8)

        ]}

    }
    
    func setView(gist: Gist) {
        setImage(imageUrl: gist.owner.avatar_url)
    }
    
    private func setImage(imageUrl: String) {
        gistImageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "rickandmortyplaceholder"))
    }

}
