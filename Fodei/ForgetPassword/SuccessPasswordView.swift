//
//  SuccessPasswordView.swift
//  Fodei
//
//  Created by Danil on 25.03.2026.
//

import SwiftUI

struct SuccessPasswordView: View {
    @Environment(\.dismiss) private var dismiss
    var onDismiss: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Image("successIcon")
                .shadow(color:Color(#colorLiteral(red: 0.2947646379, green: 0.7963799834, blue: 1, alpha: 1)).opacity(0.24), radius: 30, x: 0, y: 10)
            Text("Success")
                .foregroundStyle(Color(#colorLiteral(red: 0.2156862745, green: 0.2549019608, blue: 0.3176470588, alpha: 1)))
                .font(.interBold(size: 24))
                .frame(height: 36)
                .padding(.top, 29)
            Text("Please check your email for create \na new password")
                .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
                .font(.interMedium(size: 16))
                .multilineTextAlignment(.center)
            Text("Can't get email? \(Text("Resubmit").foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1))))")
                .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
                .font(.interBold(size: 16))
                .frame(height: 36)
                .padding(.top, 28)
                .onTapGesture {
                    dismiss()
                }
            Spacer()
            GeneralButton(
                text: "Submit",
                style: .greenState
            ) {
                print("need to submit")
                onDismiss()
            }
            .padding(.horizontal, 60)
        }
    }
}

#Preview {
    SuccessPasswordView {
        
    }
}
