//
//  SimpleDataRowView.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 20/10/25.
//

import UIKit

final class SimpleDataRowView: SceneView {
    
    private var stackView = configure(UIStackView()) {
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }

    private let titleLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.boldSystemFont(ofSize: 16.0)
    }
    
    let valueLabel = configure(UILabel()) {
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.setContentHuggingPriority(.defaultLow, for: .horizontal)
        $0.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
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
                
        stackView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 6.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0)
        ]}
                
        separatorView.constraint {[
            $0.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8.0),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0.0),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0),
            $0.heightAnchor.constraint(equalToConstant: 1.0)
        ]}
    }
    
    func setView(title: String, value: String, showSeparator: Bool) {
        titleLabel.text = title
        valueLabel.text = value
        separatorView.isHidden = !showSeparator
    }
    
}
