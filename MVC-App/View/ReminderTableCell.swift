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
            
            VStack() {
                HStack(spacing: 10) {
                    Text(reminder.timeString)
                        .font(.system(size: 22, weight: .semibold))
                    Text(reminder.dateString).font(.system(size: 19, weight: .regular))
                }
                
                if !reminder.title.isEmpty {
                    Text(reminder.title)
                        .font(.system(size: 18, weight: .medium))
                }
                
                if !reminder.message.isEmpty {
                    Text(reminder.message)
                        .font(.system(size: 18, weight: .regular))
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

#Preview {
    var reminder = Reminder(identifier: "", title: "Suryanamskar time!", message: "I need to do 3 times", timeString: "08:00", dateString: "Fri, 05 Jan")
    reminder.isSnooze = true
    return ReminderTableCell(reminder: reminder)
}
