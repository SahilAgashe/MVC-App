//
//  ReminderListController.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit
import SwiftUI

class ReminderListController: UIViewController {
    
    // MARK: - Properities
    private lazy var backBarButtonItem = {
         UIBarButtonItem(image: UIImage(named: "BackButton"), style: .plain, target: self, action: #selector(backBarButtonItemAction))
    }()
    
    private lazy var reminderTable = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private lazy var addReminderButton = {
        let button = getReminderThemeButton(withTitle: "+ Add reminder")
        button.addTarget(self, action: #selector(addReminderButtonAction), for: .touchUpInside)
        return button
    }()
    
    private var reminderArray = [Reminder]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Selectors
    @objc private func addReminderButtonAction() {
        print("DEBUG: addReminderButtonAction called...")
        let reminderController = AddReminderController()
        reminderController.addNewReminderHandler = { [weak self] reminder in
            self?.reminderArray.append(reminder)
            self?.reminderTable.reloadData()
        }
        navigationController?.pushViewController(reminderController, animated: true)
    }
    
    @objc private func backBarButtonItemAction() {
        print("DEBUG: backBarButtonItemAction called...")
        dismiss(animated: true)
    }
    
    // MARK: - Helpers
    private func setupUI() {
        title = "Reminder"
        view.backgroundColor = .reminderTheme
        navigationItem.leftBarButtonItem = backBarButtonItem
        
        view.addSubview(reminderTable)
        view.addSubview(addReminderButton)
        let constraints = [
            // reminderTable
            reminderTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reminderTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            reminderTable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reminderTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reminderTable.bottomAnchor.constraint(equalTo: addReminderButton.topAnchor, constant: -20),
            
            // addReminderButton
            addReminderButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            addReminderButton.heightAnchor.constraint(equalToConstant: 50),
            addReminderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addReminderButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

// MARK: - UITableViewDataSource
extension ReminderListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reminderArray.count
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let reminder = reminderArray[indexPath.row]
        cell.contentConfiguration = UIHostingConfiguration(content: {
            ReminderTableCell(reminder: reminder)
        })
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ReminderListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       return TableHeader(frame: .zero, titleForHeader: "Set a reminder to stay on track with your routine. We'll remind you to be awesome 🙌", font: .systemFont(ofSize: 17))
   }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 100
   }
}
