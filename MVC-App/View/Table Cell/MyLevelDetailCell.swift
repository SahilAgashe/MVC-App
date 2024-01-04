//
//  MyLevelDetailCell.swift
//  MVC-App
//
//  Created by SAHIL AMRUT AGASHE on 04/01/24.
//

import SwiftUI

struct MyLevelDetailCell: View {
    var body: some View {
        HStack() {
            ProfileImageView()
            Spacer()
            XPLevelView()
        }
    }
}

#Preview {
    MyLevelDetailCell()
}

struct ProfileImageView: View {
    var body: some View {
        Image("profile").renderingMode(.template)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundStyle(Color.cyan)
            .padding(10)
            .background(Color(UIColor.rgb(173, 225, 248)))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(.systemBlue), lineWidth: 1.5)
            }
    }
}

#Preview {
    ProfileImageView()
}

struct XPLevelView: View {
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 280, height: 60)
                .foregroundStyle(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(.systemBlue), lineWidth: 1.5)
                }
            
            VStack(spacing: 0) {
                ZStack(alignment: .leading) {
                    Text("")
                        .frame(width: 278, height: 35)
                        .background(Color(UIColor.rgb(241, 236, 178)))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(.systemBlue), lineWidth: 1.5)
                    }
                    
                    ZStack(alignment: .trailing) {
                        Text("")
                            .frame(width: 260, height: 35)
                            .background(.cyan)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color(.systemBlue), lineWidth: 1.5)
                        }
                        
                        Text("100 XP")
                            .frame(width: 80, height: 35)
                            //.background(Color(UIColor.cyan))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
//                            .overlay {
//                                RoundedRectangle(cornerRadius: 15)
//                                    .stroke(Color(.systemBlue), lineWidth: 1.5)
//                        }
                    }
                }

                HStack(spacing: 18) {
                    Spacer(minLength: 2)
                    Text("Level 9")
                    Spacer()
                    Text("30 XP To Level 10")
                    Spacer(minLength: 2)
                }
                .padding(.vertical, 5)
                //.background(.blue)
            }
            .frame(width: 278, height: 60)
            //.background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(.systemBlue), lineWidth: 1.5)
            }
            
            
        }

    }
}

#Preview {
    XPLevelView()
}
