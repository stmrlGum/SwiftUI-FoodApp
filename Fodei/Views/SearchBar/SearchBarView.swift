//
//  SearchBarView.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import SwiftUI

enum SearchBarStyle {
    case gray
    case white
}

struct SearchBarView: View {
    @Binding var text: String
    var style: SearchBarStyle
    
    var body: some View {
        HStack {
            Image("glass")
                .padding(.leading, 27)
            TextField("Search...", text: $text)
                .textFieldStyle(.plain)
                .font(.interRegular(size: 12))
                .foregroundStyle(textColor)
        }
        .frame(height: 36)
        .background(backgroundColor)
        .cornerRadius(11)
    }
}

extension SearchBarView {
    private var backgroundColor: Color {
        switch style {
        case .gray: return Color(#colorLiteral(red: 0.9019607843, green: 0.9058823529, blue: 0.9137254902, alpha: 1))
        case .white: return Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        }
    }

    private var textColor: Color {
        switch style {
        case .gray: return Color(#colorLiteral(red: 0.6117647059, green: 0.6392156863, blue: 0.6862745098, alpha: 1))
        case .white: return Color(#colorLiteral(red: 0.6117647059, green: 0.6392156863, blue: 0.6862745098, alpha: 1))
        }
    }
}

#Preview {
    SearchBarView(text: .constant("Search"), style: .gray)
        .padding(.horizontal, 48)
}
