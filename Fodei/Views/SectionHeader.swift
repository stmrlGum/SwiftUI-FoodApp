//
//  SectionHeader.swift
//  Fodei
//
//  Created by Danil on 27.03.2026.
//

import SwiftUI



struct SectionHeader: View {
    var title: String
    var subtitle: String
    var onPress: () -> ()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
               Text(title)
                    .font(.interSemiBold(size: 16))
                    .foregroundStyle(Color(#colorLiteral(red: 0.1608402133, green: 0.214548111, blue: 0.2791419327, alpha: 1)))
                    .frame(height: 19)
                Text(subtitle)
                    .font(.interMedium(size: 12))
                    .foregroundStyle(Color(#colorLiteral(red: 0.4944067001, green: 0.523111999, blue: 0.5743489861, alpha: 1)))
                    .frame(height: 15)
            }
            Spacer()
            HStack {
                Text("See All")
                    .font(.interMedium(size: 12))
                    .foregroundStyle(Color(#colorLiteral(red: 0.4944067001, green: 0.523111999, blue: 0.5743489861, alpha: 1)))
                Image("grayButton")
            }
        }
        .onTapGesture {
            onPress()
        }
    }
}
