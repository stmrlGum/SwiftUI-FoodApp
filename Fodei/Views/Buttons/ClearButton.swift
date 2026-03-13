//
//  ClearButton.swift
//  Fodei
//
//  Created by Danil on 12.03.2026.
//

import SwiftUI

struct ClearButtonView: View {
    var text: String
    var onPress: (() -> ())?
    var body: some View {
        Button {
            onPress?()
        } label: {
            Text(text)
                .foregroundStyle(.gray)
        }

    }
}
