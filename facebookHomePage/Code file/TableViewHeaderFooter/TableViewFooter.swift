//
//  TableViewFooter.swift
//  facebookHomePage
//
//  Created by Amankeldi Zhetkergen on 02.10.2024.
//

import UIKit

class TableViewFooter: UIView {

    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemRed, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
        addSubview(button)
        
        let buttonLabelConstraints = [
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(buttonLabelConstraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
