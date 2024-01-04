//
//  Reminder.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 04/01/24.
//

import Foundation

struct Reminder {
    let identifier: String
    let title: String
    let message: String
    let timeString: String
    let dateString: String
    var isSnooze = false
}
