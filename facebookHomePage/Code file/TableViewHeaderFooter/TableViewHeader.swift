//
//  TableViewHeaderController.swift
//  facebookHomePage
//
//  Created by Amankeldi Zhetkergen on 30.09.2024.
//

import UIKit

class TableViewHeader: UIView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Facebook"
        label.textColor = .black
        label.font = .systemFont(ofSize: .init(18), weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        self.backgroundColor = .systemBlue
        
        let headerLabelConstraints = [
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(headerLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
