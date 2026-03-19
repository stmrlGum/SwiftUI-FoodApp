//
//  GeneralLabel.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI

struct GeneralLabel: View {
    
    var label: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(label)
                .frame(height: 36)
                .padding(.leading, 10)
                .font(.interSemiBold(size: 14))
            Group {
                if isSecure {
                    SecureField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6392156863, blue: 0.6862745098, alpha: 1)))
                    )
                } else {
                    TextField(
                        "",
                        text: $text,
                        prompt: Text(placeholder)
                            .foregroundColor(Color(#colorLiteral(red: 0.6117647059, green: 0.6392156863, blue: 0.6862745098, alpha: 1)))
                    )
                }
            }
            .frame(height: 48)
            .padding(.horizontal, 12)
            .font(.interRegular(size: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        Color(#colorLiteral(red: 0.7450980392, green: 0.7725490196, blue: 0.8196078431, alpha: 1)),
                        lineWidth: 1
                    )
            )
        }
    }
}

#Preview {
    @Previewable @State var username = ""
    GeneralLabel(
        label: "Username",
        placeholder: "Enter your username",
        text: $username
    )
    .padding(.horizontal, 24)
}
