//
//  RegistrationView.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI

struct RegistrationView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.45)
            VStack(alignment: .center) {
                GrabberView()
                    .padding(.top, 24)
                    .frame(width: 48)
                HStack {
                    Color.black
                    
                }
                .frame(height: 31)
                .padding(.top, 40)
                .padding(.horizontal, 60)
                VStack(spacing: 8) {
                    GeneralLabel(label: "Full Name", placeholder: "Enter your full name", text: $username, isSecure: false)
                    GeneralLabel(label: "Full Name", placeholder: "Enter your full name", text: $username, isSecure: false)
                    GeneralLabel(label: "Full Name", placeholder: "Enter your full name", text: $username, isSecure: false)
                }
                .padding(.horizontal, 24)
                VStack {
                    GeneralButton(text: "Registration", style: .inActive)
                    Divider()
                        .padding(.horizontal, 60)
                    GeneralButton(text: "Registration", style: .inActive)
                }
                .padding(.top, 34)
                .padding(.horizontal, 60)
                .padding(.bottom, 32)
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 24,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 24
                )
            )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RegistrationView()
}
