//
//  DailyTaskTableCell.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 02/01/24.
//

import SwiftUI


struct DailyTaskTableCell: View {
    
    let dailyTasks: [DailyTask]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(dailyTasks, id: \.self) { dailyTask in
                    VStack(alignment: .leading, spacing: 15) {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(dailyTask.title)
                                .font(.system(size: 15, weight: .semibold))
                            Text(dailyTask.type.description)
                                .font(.system(size: 13, weight: .semibold))
                            
                            Text(dailyTask.coach)
                                .font(.system(size: 12, weight: .regular))
                        }
                        
                        
                        Spacer()
                        
                        VStack {
                            Text("⚡ \(dailyTask.xpValue) XP  ")
                                .font(.system(size: 12, weight: .bold))
                            
                            +
                            
                            Text("  🕑 \(Int(dailyTask.duration)) mins ")
                                .font(.system(size: 12, weight: .bold))
                        }
                        
                        HStack {
                            Spacer()
                        }
                    }.padding()
                        .foregroundStyle(.white)
                        .frame(width: 270, height: 160)
                        .background(Image("yellow-purple-white-bkg").resizable().frame(width: 270, height: 160).aspectRatio(contentMode: .fill))
                        .border(.white, width: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            
        }
        
    }
}

#Preview {
    DailyTaskTableCell(dailyTasks: [
        .init(title: "Day2: Steps To Recharge", type: .meditation, coach: "Muskaan", xpValue: 10, duration: 16),
    ])
}
