//
//  SearchBarView.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image("glass")
                .padding(.leading, 27)
            TextField("Search...", text: $text)
                .textFieldStyle(.plain)
                .font(.interRegular(size: 12))
                .foregroundStyle(Color(#colorLiteral(red: 0.6742052436, green: 0.7001355886, blue: 0.7406399846, alpha: 1)))
        }
        .frame(height: 36)
        .background(Color(#colorLiteral(red: 0.9213625789, green: 0.9247634411, blue: 0.9309970737, alpha: 1)))
        .cornerRadius(11)
    }
}

#Preview {
    SearchBarView(text: .constant("Search"))
        .padding(.horizontal, 48)
}
