//
//  GistDataRowView.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 20/10/25.
//

import UIKit

final class GistDataRowView: SceneView {
    
    private var stackView = configure(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.spacing = 4.0
    }
    
    private var titleLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .lightGray
        $0.font = UIFont.systemFont(ofSize: 12)
    }

    private var valueLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
    }

    private var separatorView = configure(UIView()) {
        $0.backgroundColor = .darkGray
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func buildViewHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(valueLabel)
        addSubview(separatorView)
    }
    
    override func setupConstraints() {
        stackView.constraint{[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0)
        ]}
        
        separatorView.constraint {[
            $0.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0),
            $0.heightAnchor.constraint(equalToConstant: 1.0)
        ]}
    }
    
    func setView(title: String, value: String, showSeparator: Bool) {
        titleLabel.text = title
        valueLabel.text = value.capitalized
        separatorView.isHidden = !showSeparator
    }

}
