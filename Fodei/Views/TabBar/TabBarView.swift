//
//  TabBarView.swift
//  Fodei
//
//  Created by Danil on 25.03.2026.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedTab: TabBarEnums
    var body: some View {
        HStack {
            ForEach(TabBarEnums.allCases, id: \.self) { tab in
                Spacer()
                Button {
                    selectedTab = tab
                } label: {
                    Image(selectedTab == tab ? tab.selectedIcon : tab.icon)
                }
                Spacer()
                
            }
        }
        .frame(height: 64)
        .background(.white)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 20
            )
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TabBarView(selectedTab: .constant(.home))
}
