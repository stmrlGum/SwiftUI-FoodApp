//
//  ForgetPasswordView.swift
//  Fodei
//
//  Created by Danil on 19.03.2026.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    @State var viewModel: ForgetPasswordViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Forget Password")
                        .font(.interBold(size: 20))
                        .frame(height: 36)
                    Text("Enter your registered email below")
                        .font(.interMedium(size: 16))
                        .frame(height: 21)
                        .foregroundStyle(Color(#colorLiteral(red: 0.6742052436, green: 0.7001355886, blue: 0.7406399846, alpha: 1)))
                    
                }
                .padding(.top, 117)
                VStack(alignment: .leading, spacing: 16) {
                    GeneralLabel(
                        label: "Email address",
                        placeholder: "Eg namaemail@emailkamu.com",
                        text: $viewModel.email,
                        isSecure: false
                    )
                    Text("Remember the password? \(Text("Sign in").foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)))).")
                        .font(.interRegular(size: 10))
                        .padding(.horizontal, 12)
                        .onTapGesture {
                            dismiss()
                        }
                }
                .padding(.top, 56)
                Spacer()
                GeneralButton(
                    text: "Submit",
                    style: viewModel.isEmailValid ? .greenState : .inActive
                ) {
                    viewModel.submitEmail()
                }
                .padding(.horizontal, 60)
            }
            .padding(.horizontal, 24)
            .navigationDestination(isPresented: $viewModel.showNext) {
                SuccessPasswordView {
                    dismiss()
                }
                .navigationBarBackButtonHidden()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    //ForgetPasswordView()
    ScreenFactory.makeForgetPassword()
}
