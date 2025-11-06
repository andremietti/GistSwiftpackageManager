//
//  GistView.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 11/04/25.
//

import UIKit
import Kingfisher


enum StringStatus: String {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

final class GistView: SceneView {
    
    //MARK: - Properties
    private let gistImageView = configure(UIImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
        $0.layer.masksToBounds = true
    }
        
    private var stackView = configure(UIStackView()) {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 4.0
    }

    private let titleDataRowView = SimpleDataRowView()
    private let createdDatetView = GistDataRowView()
    private let updatedDateView = GistDataRowView()
    
    //MARK: - Setup
    override func layoutSubviews() {
        gistImageView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 10.0)
    }
    
    override func buildViewHierarchy() {
        backgroundColor = UIColor(red: 61.0/255.0, green: 62.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        contentView.backgroundColor = .clear
        addSubview(gistImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(titleDataRowView)
        stackView.addArrangedSubview(createdDatetView)
        stackView.addArrangedSubview(updatedDateView)

        setupConstraints()
    }
    
    override func setupConstraints() {
        gistImageView.constraint {[
            $0.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            $0.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            $0.widthAnchor.constraint(equalToConstant: 130.0),
            $0.heightAnchor.constraint(equalToConstant: 130.0),
        ]}
                        
        stackView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: gistImageView.trailingAnchor, constant: 10.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4.0)
        ]}
    }
    
}


//MARK: - Functional Methods
extension GistView {
    
    func setView(gist: Gist) {
        titleDataRowView.setView(title: gist.owner.login, value: gist.description, showSeparator: false)
        createdDatetView.setView(title: GistListLocalize.createdAt.rawValue, value: gist.created_at, showSeparator: false)
        updatedDateView.setView(title: GistListLocalize.updatedAt.rawValue, value: gist.updated_at, showSeparator: false)
        
        setImage(imageUrl: gist.owner.avatar_url)
    }
    
    private func setImage(imageUrl: String) {
        gistImageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage(named: "rickandmortyplaceholder"))
    }
    
}

