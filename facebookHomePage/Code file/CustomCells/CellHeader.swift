//
//  CellHeaderFooter.swift
//  facebookHomePage
//
//  Created by Amankeldi Zhetkergen on 02.10.2024.
//

import UIKit

class CellHeader: UITableViewHeaderFooterView {

    static let identifier = String(describing: CellHeader.self)
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = .systemGray
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 12, weight: .regular)
        nameLabel.text = "Default"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    public func setCellHeader() {
        setupUI()
    }
    
    public func setCellHeader(with name: String) {
        setupUI()
        addHeaderLabel(label: name)
    }
    
    private func setupUI() {
        let bView = UIView()
        bView.backgroundColor = .systemGray6
        self.backgroundView = bView
    }
    
    private func addHeaderLabel(label: String) {
        addSubview(nameLabel)
        nameLabel.text = label
        
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
        ]
        
        NSLayoutConstraint.activate(nameLabelConstraints)
    }
}
