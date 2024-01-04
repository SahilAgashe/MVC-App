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
        
        let activityRoutineCellNib = UINib(nibName: "ActivityRoutineTableCell", bundle: nil)
        tableView.register(activityRoutineCellNib, forCellReuseIdentifier: "ActivityRoutineTableCell")
        
        tableView.register(RenewPremiumCell.self, forCellReuseIdentifier: "RenewPremiumCell")
        
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var dailyTasks = [DailyTask]()
    var activityRoutineTasks = [ActivityRoutineTask]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateDatabase()
    }
    
    
    // MARK: - Selectors
    @objc private func reminderBarButtonItemAction() {
        let nav = UINavigationController(rootViewController: ReminderListController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
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
    
    private func updateDatabase() {
        dailyTasks = [
            .init(title: "Day2: Steps To Recharge", type: .meditation, coach: "Muskaan", xpValue: 10, duration: 16),
            .init(title: "Traditional Suryanamaskar", type: .workout, coach: "", xpValue: 10, duration: 16)
        ]
        
        activityRoutineTasks = [
            .init(title: "Gratitude", theme: .journal, xpValue: 10, duration: 1),
            .init(title: "For Inner Peace", theme: .music, xpValue: 10, duration: 1)
        ]
    }

}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == TableSection.activityRoutine.rawValue {
            return  activityRoutineTasks.count
        }
        else { 
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == TableSection.renewLevelPremium.rawValue {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RenewPremiumCell") as? RenewPremiumCell else {
                return UITableViewCell()
            }
            cell.setLabelText(text: "Your Level premium is about to expire, renew now!")
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == TableSection.dailyTask.rawValue {
            let cell = UITableViewCell()

            cell.contentConfiguration = UIHostingConfiguration(content: {
                DailyTaskTableCell(dailyTasks: dailyTasks)
            })
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.section == TableSection.activityRoutine.rawValue {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityRoutineTableCell") as? ActivityRoutineTableCell else {
                return UITableViewCell()
            }
            let backgroundImageName = indexPath.row % 2 == 0 ? "redGradient" : "purple"
            let activityRoutineTask = activityRoutineTasks[indexPath.row]
            cell.setupInterface(activityRoutineTask: activityRoutineTask, backgroundImageName: backgroundImageName)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = UITableViewCell()
        return cell
    }
    
}

// MARK: - UITableViewDelegate
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == TableSection.renewLevelPremium.rawValue {
            return 90
        }
        else if indexPath.section == TableSection.dailyTask.rawValue {
            return 200
        } 
        else if indexPath.section == TableSection.activityRoutine.rawValue {
            return 126
        }
        else {
            return 20
        }
    }
    
}

