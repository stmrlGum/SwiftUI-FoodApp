//
//  WelcomeView.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject var viewModel: WelcomeViewModel
    @State private var showScreen = false
    
    var body: some View {
        VStack {
            Image("orderSuccess")
            VStack(spacing: 8) {
                Text("Welcome")
                    .font(.interSemiBold(size: 24))
                    .frame(height: 36)
                    .foregroundStyle(Color(#colorLiteral(red: 0.1215686275, green: 0.1607843137, blue: 0.2156862745, alpha: 1)))
                Text("Before enjoying Foodmedia services\nPlease register first")
                    .font(.interRegular(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(#colorLiteral(red: 0.2941176471, green: 0.3333333333, blue: 0.3882352941, alpha: 1)))
            }
            .padding(.top, 55.01)
            VStack(spacing: 16) {
                GeneralButton(text: "Create Account", style: .greenState) {
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        showScreen = true
                    }
                    
                }
                GeneralButton(text: "Login", style: .lightGreenState) {
                    //
                }
            }
            .padding(.horizontal, 60)
            .padding(.top, 95)
            Text(
                "By logging in or registering, you have agreed to the \(Text("Terms and Conditions").foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)))) and \(Text("Privacy Policy").foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1))))."
            )
            .font(.interRegular(size: 10))
            .padding(.top, 8)
            .padding(.horizontal, 15)
        }
        .navigationBarBackButtonHidden()
        .fullScreenCover(isPresented: $showScreen) {
            RegistrationView()
                .presentationBackground(.clear)
        }
    }
}

#Preview {
    ScreenFactory.makeWelcome()
}
