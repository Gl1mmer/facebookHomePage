//
//  ViewController.swift
//  facebookHomePage
//
//  Created by Amankeldi Zhetkergen on 30.09.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    let sections = ["profile", "groups", "favorites", "settings"]
    let sectionElements = [
            ["Username"],
            ["Friends", "Events", "Groups", "CMU", "Town Hall", "Instant Games", "See More..."],
            ["Add favorites..."],
            ["Settings", "Privacy shortcuts", "Help and Support"]
        ]
    let cellLogos = [
        ["person.crop.circle.fill"],
        ["person.2.fill", "calendar.circle", "person.3.fill", "graduationcap.fill", "house.circle.fill", "gamecontroller.fill", nil],
        [nil],
        ["gear", "lock.fill", "questionmark.app"]
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = false
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        tableView.register(CustomCells.self, forCellReuseIdentifier: CustomCells.identifier)
        tableView.register(CellHeader.self, forHeaderFooterViewReuseIdentifier: CellHeader.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
        
        let TableViewHeader = TableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        tableView.tableHeaderView = TableViewHeader
        if #available(iOS 15.0, *) { tableView.sectionHeaderTopPadding = 0.0 }
        
        let TableViewFooter = TableViewFooter(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120))
        tableView.tableFooterView = TableViewFooter
        if #available(iOS 15.0, *) { tableView.sectionHeaderTopPadding = 0.0 }
        
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(tableViewConstraints)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellHeader.identifier)  as? CellHeader else {
                fatalError("Failed to create a header cell")
            }
            header.setCellHeader(with: "FAVORITES")
            return header
        } else {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CellHeader.identifier)  as? CellHeader else {
                fatalError("Failed to create a header cell")
            }
            header.setCellHeader()
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 54
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionElements[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as? ProfileCell else {
                fatalError("Could not dequeue cell [1]")
            }
            cell.configurateProfile(name: sectionElements[indexPath.section][indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCells.identifier, for: indexPath) as? CustomCells else {
                fatalError("Could not dequeue cell [1]")
            }
            if (indexPath.section == 1 && indexPath.row == 6) || (indexPath.section == 2) {
                cell.configurateCell(cellName: sectionElements[indexPath.section][indexPath.row])
            } else {
                cell.configurateCell(cellName: sectionElements[indexPath.section][indexPath.row], iconName: cellLogos[indexPath.section][indexPath.row])
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        } else {
            return 42
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

    
