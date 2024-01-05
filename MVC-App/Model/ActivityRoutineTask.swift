//
//  ActivityRoutineTask.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import Foundation

enum ActivityRoutineTheme {
    case journal
    case music
    
    var description: String {
        switch self {
        case .journal: return "Journal"
        case .music: return "Music"
        }
    }
}

struct ActivityRoutineTask {
    let title: String
    let theme: ActivityRoutineTheme
    let xpValue: Int
    let duration: TimeInterval
}
