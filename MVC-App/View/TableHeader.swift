//
//  TableHeader.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit

class TableHeader: UIView {
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initializers
    init(frame: CGRect, titleForHeader: String = "", font: UIFont = .boldSystemFont(ofSize: 20)) {
        super.init(frame: frame)
        self.titleLabel.text = titleForHeader
        self.titleLabel.font = font
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Helpers
    private func setupUI() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
