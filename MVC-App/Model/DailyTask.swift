//
//  DailyTask.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import Foundation

enum ExerciseType: Int {
    case meditation
    case workout
    
    var description: String {
        switch self {
        case .meditation: return "Meditation"
        case .workout: return "Workout"
        }
    }
}

struct DailyTask: Hashable {
    let title: String
    let type: ExerciseType
    let coach: String
    let xpValue: Int
    let duration: TimeInterval
}


