//
//  DailyTask.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import Foundation

struct DailyTask: Hashable {
    let title: String
    let type: ExerciseType
    let coach: String
    let xpValue: Int
    let duration: TimeInterval
}
