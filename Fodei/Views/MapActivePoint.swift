//
//  MapActivePoint.swift
//  Fodei
//
//  Created by Danil on 07.04.2026.
//

import SwiftUI

struct MapActivePoint: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)), lineWidth: 4)
                .background(Circle().foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)).opacity(0.28)))
                .frame(width: 139, height: 139)
            Image("MapPoint")
        }
    }
}
