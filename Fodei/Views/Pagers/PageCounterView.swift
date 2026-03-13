//
//  PageCounterView.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

struct PageCounterView: View {
    @Binding var page: Int
    var totalPage: Int

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalPage, id: \.self) { index in
                Circle()
                    .fill(index == page ? Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)) : Color.gray)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(10)
        .cornerRadius(10)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    PageCounterView(page: .constant(0), totalPage: 3)
    
}
