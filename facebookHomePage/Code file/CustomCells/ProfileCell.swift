//
//  ProfileCell.swift
//  facebookHomePage
//
//  Created by Amankeldi Zhetkergen on 30.09.2024.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    static let identifier = String(describing: ProfileCell.self)
    
    private let iconImage: UIImageView = {
        let iconImage = UIImageView()
        iconImage.image = UIImage(systemName: "person.crop.circle.fill")
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        return iconImage
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        nameLabel.text = "Default"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let underNameLabel: UILabel = {
        let underNameLabel = UILabel()
        underNameLabel.textColor = .secondaryLabel
        underNameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        underNameLabel.text = "View your profile"
        underNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return underNameLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(iconImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(underNameLabel)
        
        let iconImageConstraints = [
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            iconImage.widthAnchor.constraint(equalToConstant: 45),
            iconImage.heightAnchor.constraint(equalToConstant: 45),
            iconImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10)
        ]
        let underNameLabelConstraints = [
            underNameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 20),
            underNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 12)
        ]
        
        NSLayoutConstraint.activate(iconImageConstraints)
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(underNameLabelConstraints)
    }

    func configurateProfile(name: String) {
        nameLabel.text = name
    }

}

    
   
