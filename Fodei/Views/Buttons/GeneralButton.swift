//
//  GeneralButton.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI

enum GeneralButtonState {
    case greenState
    case lightGreenState
    case inActive
}

struct GeneralButton: View {
    var text: String
    var style: GeneralButtonState
    var height: CGFloat = 49
    var onPress: (() -> ())?
    var body: some View {
        Button {
            onPress?()
        } label: {
            Text(text)
                .font(.interBold(size: 14))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundColor(textColor)
                .frame(height: height)
            
        }
        .background(backgroundColor)
        .cornerRadius(8)
        .disabled(style == .inActive ? true : false)
    }
}

extension GeneralButton {
    private var backgroundColor: Color {
        switch style {
        case .greenState: return Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1))
        case .lightGreenState: return Color(#colorLiteral(red: 0.8196078431, green: 0.9803921569, blue: 0.8980392157, alpha: 1))
        case .inActive: return Color(#colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1))
        }
    }

    private var textColor: Color {
        switch style {
        case .greenState: return .white
        case .lightGreenState: return Color(#colorLiteral(red: 0.06274509804, green: 0.7254901961, blue: 0.5058823529, alpha: 1))
        case .inActive: return Color(#colorLiteral(red: 0.6117647059, green: 0.6392156863, blue: 0.6862745098, alpha: 1))
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GeneralButton(text: "Create Account", style: .inActive)
}
