//
//  RenewPremiumCell.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 04/01/24.
//

import UIKit

class RenewPremiumCell: UITableViewCell {

    // MARK: - Properties
    private lazy var txtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var exploreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Explore   →", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        
        button.widthAnchor.constraint(equalToConstant: 90).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return button
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Helpers
    private func setupUI() {
        
        let backgroundView = UIImageView(image: UIImage(named: "skyGradient"))
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.borderWidth = 3
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderColor = UIColor.white.cgColor
        backgroundView.clipsToBounds = true
        contentView.addSubview(backgroundView)

        let hstack = UIStackView(arrangedSubviews: [txtLabel, exploreButton])
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.spacing = 10
        hstack.alignment = .center
        contentView.addSubview(hstack)
        
        NSLayoutConstraint.activate([
            // backgroundView
            backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // hstack
            hstack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            hstack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            hstack.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            hstack.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
        ])
       
    }
    
    // MARK: - Public methods
    func setLabelText(text: String) {
        self.txtLabel.text = text
    }
}
