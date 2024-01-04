//
//  AddReminderController.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import UIKit
import UserNotifications

class AddReminderController: UIViewController {
    
    // MARK: - Properities
    private lazy var backBarButtonItem = {
         UIBarButtonItem(image: UIImage(named: "BackButton"), style: .plain, target: self, action: #selector(backBarButtonItemAction))
    }()
    
    private lazy var titleTextField: UITextField = {
        let tf = getTextField(with: "Title")
        tf.delegate = self
        return tf
    }()
    
    private lazy var messageTextField: UITextField = {
        let tf = getTextField(with: "Message")
        tf.delegate = self
        return tf
    }()
    
    private lazy var saveButton: UIButton = {
        let button = getReminderThemeButton(withTitle: "Save")
        button.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.locale = .current
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .clear
        return datePicker
    }()
    
    private lazy var snoozeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Snooze"
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private lazy var snoozeSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.preferredStyle = .sliding
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.onTintColor = .red
        switchButton.thumbTintColor = .white
        switchButton.isOn = false
        switchButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.8);
        return switchButton
    }()
    
    var addNewReminderHandler: ((Reminder) -> ())?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Set a Reminder"
        navigationItem.leftBarButtonItem = backBarButtonItem
        view.backgroundColor = .reminderTheme
        
        view.addSubview(titleTextField)
        view.addSubview(messageTextField)
        view.addSubview(datePicker)
        view.addSubview(snoozeLabel)
        view.addSubview(snoozeSwitch)
        view.addSubview(saveButton)
        setupConstraints()
        
        // for dismissing keyboard, if tap on screen.
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotificationAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotificationAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Selectors
    @objc private func backBarButtonItemAction() {
        print("DEBUG: backBarButtonItemAction called...")
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func keyboardWillShowNotificationAction() {
        print("DEBUG: keyboardWillShowNotificationAction called...")
    }
    
    @objc private func keyboardWillHideNotificationAction() {
        print("DEBUG: keyboardWillHideNotificationAction called...")
    }
    
    @objc private func saveButtonAction()
    {
        scheduleNotification()
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers

    private func setupConstraints()
    {
        NSLayoutConstraint.activate([
            // titleTextField
            self.titleTextField.heightAnchor.constraint(equalToConstant: 45),
            self.titleTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            self.titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            // messageTextField
            self.messageTextField.heightAnchor.constraint(equalToConstant: 45),
            self.messageTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            self.messageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.messageTextField.topAnchor.constraint(equalTo: self.titleTextField.bottomAnchor, constant: 5),
            
            // datePicker
            self.datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.datePicker.topAnchor.constraint(equalTo: messageTextField.bottomAnchor, constant: 10),
            datePicker.heightAnchor.constraint(equalToConstant: 150),
            
            // snoozeLabel
            snoozeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            snoozeLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10),
            
            // snoozeSwitch
            snoozeSwitch.leadingAnchor.constraint(equalTo: snoozeLabel.trailingAnchor, constant: 20),
            snoozeSwitch.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 11),
            snoozeSwitch.widthAnchor.constraint(equalToConstant: 30),
            snoozeSwitch.heightAnchor.constraint(equalToConstant: 30),
            
            
            // saveButton
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    private func scheduleNotification() {
        guard let title = titleTextField.text,
              let message = messageTextField.text else {
            print("DEBUG: Unable to get title or message!")
            return
        }
        
        // Create the notification content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = "Alarm Notification"
        content.body = message
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "iphoneRingtone.mp3"))
        content.categoryIdentifier = "alarmCategory"
        
        // Create the notification trigger
        let snoozeAction = UNNotificationAction(identifier: "snoozeAction", title: "Snooze", options: UNNotificationActionOptions.init())
        let stopAction = UNNotificationAction(identifier: "stopAction", title: "Stop", options: UNNotificationActionOptions.init())
        let alarmDate: Date = datePicker.date
        let alarmDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: alarmDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: alarmDateComponents, repeats: snoozeSwitch.isOn)
//        if trigger.repeats {
//            let alarmCategryWithSnooze = UNNotificationCategory(identifier: "alarmCategory", actions: [snoozeAction,stopAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
//            currentNotificationCenter.setNotificationCategories([alarmCategryWithSnooze])
//        }
//        else {
//            let alarmCategryWithoutSnooze = UNNotificationCategory(identifier: "alarmCategory", actions: [stopAction], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "", options: .customDismissAction)
//            currentNotificationCenter.setNotificationCategories([alarmCategryWithoutSnooze])
//        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        let timeString = formatter.string(from: alarmDate)
        formatter.dateFormat = "EEE, MMM d"
        let dateString = formatter.string(from: alarmDate)
        let identifier = UUID().uuidString
        var reminder = Reminder(identifier: identifier, title: title, message: message, timeString: timeString, dateString: dateString)
        reminder.isSnooze = snoozeSwitch.isOn
        addNewReminderHandler?(reminder)
        LocalNotificationManager.shared.addNotification(content: content, trigger: trigger, notificationIdentifier: identifier)
    }
    
}

// MARK: - UITextFieldDelegate
extension AddReminderController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // on pressing return key in keyboard, this method will be called.
        print("DEBUG: textFieldShouldReturn called...")
        textField.resignFirstResponder()
        return true
    }
}

