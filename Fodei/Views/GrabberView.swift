//
//  GrabberView.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI

struct GrabberView: View {
    var body: some View {
        Rectangle()
            .frame(height: 6)
            .foregroundStyle(Color(#colorLiteral(red: 0.8235294118, green: 0.831372549, blue: 0.8470588235, alpha: 1)))
            .cornerRadius(3)
    }
}

#Preview {
    GrabberView()
}
