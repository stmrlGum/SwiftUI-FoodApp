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
    @Environment(\.dismiss) private var dismiss
    @State private var showSheet = true
    // @State private var showSheet = false
    @State private var selected = 0
    @Namespace private var animationNamespace

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.45)
                .onTapGesture {
                    closeSheet()
                }
            registrationSheet
                .frame(height: 576)
        }
        .ignoresSafeArea()
    }

    private var registrationSheet: some View {
        VStack(alignment: .center) {
            GrabberView()
                .padding(.top, 24)
                .frame(width: 48)

            HStack(spacing: 0) {
                WithGrabberButton(
                    text: "Create Account",
                    isActive: selected == 0,
                    namespace: animationNamespace
                )
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    selected = 0
                }

                WithGrabberButton(
                    text: "Login",
                    isActive: selected == 1,
                    namespace: animationNamespace
                )
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    selected = 1
                }
            }
            .frame(height: 60)
            .padding(.horizontal, 36)
            .animation(.easeInOut(duration: 0.25), value: selected)
            registrationContent

            
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 24,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 24)
        )
        .offset(y: showSheet ? 0 : UIScreen.main.bounds.height)
        .animation(.easeOut(duration: 0.3), value: showSheet)
        .onAppear {
                showSheet = true
            }
    }
    
    private var registrationContent: some View {
        TabView(selection: $selected) {
            VStack(alignment: .center, spacing: 8) {
                GeneralLabel(
                    label: "Full Name",
                    placeholder: "Enter your full name",
                    text: $username,
                    isSecure: false
                )
                GeneralLabel(
                    label: "Email address",
                    placeholder: "Eg namaemail@emailkamu.com",
                    text: $username,
                    isSecure: false
                )
                GeneralLabel(
                    label: "Password",
                    placeholder: "**** **** ****",
                    text: $password,
                    isSecure: true
                )
                VStack(spacing: 8) {
                    GeneralButton(text: "Registration", style: .inActive)

                    Divider()
                        .padding(.horizontal, 60)

                    SocialButton(type: .googleSignUp)
                }
                .padding(.top, 34)
                .padding(.horizontal, 36)
                .padding(.bottom, 32)
            }
            .padding(.horizontal, 24)
            .tag(0)
            VStack(alignment: .center, spacing: 8) {
                GeneralLabel(
                    label: "Email address",
                    placeholder: "Eg namaemail@emailkamu.com",
                    text: $username,
                    isSecure: false
                )
                GeneralLabel(
                    label: "Password",
                    placeholder: "**** **** ****",
                    text: $username,
                    isSecure: false
                )
                Button {
                    //
                    print("forgot passwd")
                } label: {
                    HStack {
                        Spacer()
                        Text("Forget Password?")
                            .font(.interSemiBold(size: 14))
                            .foregroundStyle(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)))
                            .frame(height: 36)
                    }
                }
                VStack(spacing: 8) {
                    GeneralButton(text: "Login", style: .inActive)

                    Divider()
                        .padding(.horizontal, 60)

                    SocialButton(type: .googleSignUp)
                }
                .padding(.top, 18)
                .padding(.horizontal, 36)
                .padding(.bottom, 83)
            }
            .padding(.horizontal, 24)
            .tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.25), value: selected)
    }
    
    private func closeSheet() {
        withAnimation(.easeIn(duration: 0.3)) {
                showSheet = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                var transaction = Transaction()
                        transaction.disablesAnimations = true

                        withTransaction(transaction) {
                            dismiss()
                        }
            }
    }
}

#Preview {
    RegistrationView()
}
