//
//  SocialButton.swift
//  Fodei
//
//  Created by Danil on 15.03.2026.
//

import SwiftUI

enum SocialButtonType {
    case googleSignUp
    case googleLogin
}

struct SocialButton: View {
    var onPress: (() -> ())?
    var type: SocialButtonType
    var body: some View {
        Button {
            onPress?()
        } label: {
            HStack {
                Image("googleButton")
                Text("Sign up with Google")
                    .font(.interBold(size: 14))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.1777858436, green: 0.1777858436, blue: 0.1777858436, alpha: 1)))
                    .frame(height: 49)
            }
            .padding(.horizontal, 38)
        }
        .background(Color(#colorLiteral(red: 0.965680182, green: 0.965680182, blue: 0.965680182, alpha: 1)))
        .cornerRadius(8)
    }
}

extension SocialButton {
    private var buttonTitle: String {
        switch type {
        case .googleLogin: return "Login with Google"
        case .googleSignUp: return "Sign up with Google"
        }
    }
}

#Preview {
    SocialButton(type: .googleLogin)
        .padding(.horizontal, 60)
}
