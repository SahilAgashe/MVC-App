//
//  ViewController.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 02/01/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    // MARK: - Properties
    private lazy var reminderBarButtonItem: UIBarButtonItem = {
        let clockIcon = UIImage(named: "clockIcon")?.withRenderingMode(.alwaysOriginal)
        let barBtn = UIBarButtonItem(image: clockIcon, style: .plain, target: self, action: #selector(reminderBarButtonItemAction))
        return barBtn
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableCell")
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - Selectors
    @objc private func reminderBarButtonItemAction() {
        
    }
    
    // MARK: - Helpers
    private func setupUI() {
        
        navigationItem.rightBarButtonItem = reminderBarButtonItem
        
        // backgroundView
        let backgroundView = UIImageView(image: UIImage(named: "background"))
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        let backgrounViewConstraints = [
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(backgrounViewConstraints)
        
        
        // tableView
        view.addSubview(tableView)
        let tableViewConstraints = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 { return 2}
        else { return 1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") else {
            return UITableViewCell()
        }
        
        let dailyTasks: [DailyTask] = [
            .init(title: "Day2: Steps To Recharge", type: .meditation, coach: "Muskaan", xpValue: 10, duration: 16),
            .init(title: "Traditional Suryanamaskar", type: .workout, coach: "", xpValue: 10, duration: 16)
        ]
        cell.contentConfiguration = UIHostingConfiguration(content: {
            DailyTaskTableCell(dailyTasks: dailyTasks)
        })
        cell.backgroundColor = .clear
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//         if section == 2 {
//            return "Must Do For Your Goals"
//        } else if section == 3 {
//            return "Activity Routine"
//        } else {
//            return ""
//        }
//    }
    

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        TableHeader(frame: .zero, titleForHeader: TableSection(rawValue: section)?.title ?? "")
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == TableSection.dailyTask.rawValue || section == TableSection.activityRoutine.rawValue {
            return 50
        } else {
            return 0
        }
    }
    
}

