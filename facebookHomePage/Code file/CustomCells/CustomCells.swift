//
//  CustomCells.swift
//  facebookHomePage
//
//  Created by Amankeldi Zhetkergen on 02.10.2024.
//

import UIKit

class CustomCells: UITableViewCell {
    
    static let identifier = String(describing: CustomCells.self)
    
    private let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        return iconImage
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        nameLabel.text = "Default"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupUI() {
        contentView.addSubview(iconImage)
        contentView.addSubview(nameLabel)
    
        let iconImageConstraints = [
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImage.widthAnchor.constraint(equalToConstant: 20),
            iconImage.heightAnchor.constraint(equalToConstant: 20),
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 45),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
    
        NSLayoutConstraint.activate(iconImageConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
    }
    
    func configurateCell(cellName: String, iconName: String?) {
        nameLabel.text = cellName
        
        if let iconName = iconName {
            iconImage.image = UIImage(systemName: iconName)
        }
        
        self.accessoryType = .disclosureIndicator
    }
    
    func configurateCell(cellName: String) {
        nameLabel.text = cellName
        nameLabel.textColor = .systemBlue
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
    }
}
