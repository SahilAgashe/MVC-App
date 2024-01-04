//
//  ReminderTableCell.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 04/01/24.
//

import SwiftUI

struct ReminderTableCell: View {
    
    let reminder: Reminder
    
    var body: some View {
        HStack() {
            Spacer()
            
            VStack {
                Text(reminder.title)
                    .font(.system(size: 17, weight: .medium))
                
                Text(reminder.message)
                    .font(.system(size: 18, weight: .regular))
                
                HStack(spacing: 20) {
                    Text(reminder.timeString)
                        .font(.system(size: 20, weight: .semibold))
                    Text(reminder.dateString).font(.system(size: 18, weight: .regular))
                }
            }
            
            Spacer()
            
            if reminder.isSnooze {
                Text("Snoozed")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(.gray)
                
                Spacer()
            }

        }
        .padding()
        .border(Color(.systemYellow), width: 2)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .background(.white)
        
    }
}

//#Preview {
//    ReminderTableCell()
//}
