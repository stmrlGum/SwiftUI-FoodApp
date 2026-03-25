//
//  RegistrationView.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animationNamespace
    
    var onDismiss: () -> Void
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.45)
                .onTapGesture {
                    closeSheet()
                }
            registrationSheet
                .frame(height: 576)
        }
        .ignoresSafeArea(.container)
        .fullScreenCover(isPresented: $viewModel.isForgotPresented) {
            ScreenFactory.makeForgetPassword()
        }
    }
}

private extension RegistrationView {
    
    var registrationSheet: some View {
        VStack {
            GrabberView()
                .padding(.top, 24)
                .frame(width: 48)
            HStack(spacing: 0) {
                WithGrabberButton(
                    text: "Create Account",
                    isActive: viewModel.selected == 0,
                    namespace: animationNamespace
                )
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    viewModel.selectTab(0)
                }
                WithGrabberButton(
                    text: "Login",
                    isActive: viewModel.selected == 1,
                    namespace: animationNamespace
                )
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    viewModel.selectTab(1)
                }
            }
            .frame(height: 60)
            .padding(.horizontal, 36)
            .animation(.easeInOut(duration: 0.25), value: viewModel.selected)
            registrationContent
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
        .offset(y: viewModel.showSheet ? 0 : UIScreen.main.bounds.height)
        .animation(.easeOut(duration: 0.3), value: viewModel.showSheet)
        .onAppear {
            viewModel.showSheet = true
        }
    }
}

private extension RegistrationView {
    var registrationContent: some View {
        TabView(selection: $viewModel.selected) {
            createAccountTab.tag(0)
            loginTab.tag(1)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.25), value: viewModel.selected)
    }
}

private extension RegistrationView {
    var createAccountTab: some View {
        VStack(spacing: 8) {
            GeneralLabel(
                label: "Full Name",
                placeholder: "Enter your full name",
                text: $viewModel.createAccountModel.fullName,
                isSecure: false
            )
            GeneralLabel(
                label: "Email address",
                placeholder: "Eg namaemail@emailkamu.com",
                text: $viewModel.createAccountModel.username,
                isSecure: false
            )
            GeneralLabel(
                label: "Password",
                placeholder: "**** **** ****",
                text: $viewModel.createAccountModel.password,
                isSecure: true
            )
            VStack(spacing: 8) {
                GeneralButton(
                    text: "Registration",
                    style: viewModel.isCreateAccountValid ? .greenState : .inActive
                ) {
                    viewModel.register()
                    dismissAndShowMain()
                }
                Divider()
                    .padding(.horizontal, 60)
                SocialButton(type: .googleSignUp)
            }
            .padding(.top, 34)
            .padding(.horizontal, 36)
            .padding(.bottom, 32)
        }
        .padding(.horizontal, 24)
    }
}

private extension RegistrationView {
    var loginTab: some View {
        VStack(spacing: 8) {
            GeneralLabel(
                label: "Email address",
                placeholder: "Eg namaemail@emailkamu.com",
                text: $viewModel.loginModel.username,
                isSecure: false
            )
            GeneralLabel(
                label: "Password",
                placeholder: "**** **** ****",
                text: $viewModel.loginModel.password,
                isSecure: true
            )
            Button {
                viewModel.forgotPassword()
            } label: {
                HStack {
                    Spacer()
                    Text("Forget Password?")
                        .font(.interSemiBold(size: 14))
                        .foregroundStyle(Color.green)
                        .frame(height: 36)
                }
            }
            VStack(spacing: 8) {
                GeneralButton(
                    text: "Login",
                    style: viewModel.isLoginValid ? .greenState : .inActive
                ) {
                    viewModel.login() // completion
                    dismissAndShowMain()
                }
                Divider()
                    .padding(.horizontal, 60)
                SocialButton(type: .googleSignUp)
            }
            .padding(.top, 18)
            .padding(.horizontal, 36)
            .padding(.bottom, 83)
        }
        .padding(.horizontal, 24)
    }
}

private extension RegistrationView {
    private func closeSheet(completion: (() -> Void)? = nil) {
        withAnimation(.easeIn(duration: 0.3)) {
            viewModel.closeSheet {
                var transaction = Transaction()
                transaction.disablesAnimations = true
                withTransaction(transaction) {
                    dismiss()
                }
            }
        }
        completion?()
    }
    
    private func dismissAndShowMain() {
        closeSheet {
            onDismiss()
        }
    }
}

#Preview {
    ScreenFactory.makeRegistration(selected: 0) {
        print("dismissed")
    }
}
