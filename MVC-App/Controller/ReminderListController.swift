//
//  ReminderListController.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit

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
        return tableView
    }()
    
    private lazy var addReminderButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("+ Add reminder", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .rgb(115, 85, 231)
        btn.addTarget(self, action: #selector(addReminderButtonAction), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Selectors
    @objc private func addReminderButtonAction() {
        print("DEBUG: addReminderButtonAction called...")
        navigationController?.pushViewController(SettingReminderController(), animated: true)
    }
    
    @objc private func backBarButtonItemAction() {
        print("DEBUG: backBarButtonItemAction called...")
        dismiss(animated: true)
    }
    
    
    // MARK: - Helpers
    private func setupUI() {
        //rgb(245,243,254)
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

extension ReminderListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1
   }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       return UITableViewCell()
   }
}

extension ReminderListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       return TableHeader(frame: .zero, titleForHeader: "Set a reminder to stay on track with your routine. We'll remind you to be awesome 🙌", font: .systemFont(ofSize: 17))
   }
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 100
   }
}
