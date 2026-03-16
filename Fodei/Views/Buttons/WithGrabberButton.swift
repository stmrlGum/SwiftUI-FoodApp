//
//  WithGrabberButton.swift
//  Fodei
//
//  Created by Danil on 15.03.2026.
//

import SwiftUI

struct WithGrabberButton: View {
    var text: String
    var activeColor: Color = Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1))
    var inactiveColor: Color = Color(#colorLiteral(red: 0.537254902, green: 0.5647058824, blue: 0.6196078431, alpha: 1))
    var isActive: Bool
    var namespace: Namespace.ID

    var body: some View {
        VStack(spacing: 10) {
            Text(text)
                .font(.interSemiBold(size: 16))
                .foregroundStyle(isActive ? activeColor : inactiveColor)

            ZStack {
                if isActive {
                    Rectangle()
                        .frame(width: 77, height: 2)
                        .foregroundStyle(activeColor)
                        .matchedGeometryEffect(id: "underline", in: namespace)
                } else {
                    Rectangle()
                        .frame(width: 77, height: 2)
                        .foregroundStyle(Color.clear)
                }
            }
        }
    }
}
