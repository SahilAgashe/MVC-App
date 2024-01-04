//
//  Helpers.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 04/01/24.
//

import UIKit

func getReminderThemeButton(withTitle title: String = "") -> UIButton {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle(title, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .reminderButtonTheme
    button.layer.cornerRadius = 10.0
    return button
}

func getTextField(with placeholder: String) -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = .white
    textField.placeholder = placeholder
    textField.layer.cornerRadius = 10
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    textField.leftViewMode = .always
    return textField
}
