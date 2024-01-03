//
//  TableSection.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 03/01/24.
//

import Foundation

enum TableSection: Int, CaseIterable {
    case myLevelDetail
    case renewLevelPremium
    case dailyTask
    case activityRoutine
    
    var title: String {
        switch self {
        case .myLevelDetail: return ""
        case .renewLevelPremium: return ""
        case .dailyTask: return "Must Do For Your Goals"
        case .activityRoutine: return "Activity Routine"
        }
    }
}
