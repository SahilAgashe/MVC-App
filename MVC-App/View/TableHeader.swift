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
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Initializers
    init(frame: CGRect, titleForHeader: String = "") {
        super.init(frame: frame)
        self.titleLabel.text = titleForHeader
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
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
