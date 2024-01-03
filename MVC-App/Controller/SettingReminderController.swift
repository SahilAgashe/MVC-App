//
//  SettingReminderController.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit

class SettingReminderController: UIViewController {
    
    // MARK: - Properities
    private lazy var backBarButtonItem = {
         UIBarButtonItem(image: UIImage(named: "BackButton"), style: .plain, target: self, action: #selector(backBarButtonItemAction))
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Set a Reminder"
        navigationItem.leftBarButtonItem = backBarButtonItem
        view.backgroundColor = .reminderTheme
    }
    
    // MARK: Selectors
    @objc private func backBarButtonItemAction() {
        print("DEBUG: backBarButtonItemAction called...")
        dismiss(animated: true)
    }
}
