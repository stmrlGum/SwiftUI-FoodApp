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
        GeometryReader { proxy in
            let bottomInset = proxy.safeAreaInsets.bottom
            let totalHeight = 64 + bottomInset
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(
                    topLeadingRadius: 20,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 20
                )
                .fill(.white)
                .frame(height: totalHeight)
                .frame(maxWidth: .infinity, alignment: .top)
                .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 4)
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
            }
            .frame(width: proxy.size.width, height: totalHeight, alignment: .top)
        }
        .frame(height: 64)
        .fixedSize(horizontal: false, vertical: true)
        .ignoresSafeArea(edges: .bottom)
        
    }
}

#Preview {
    ZStack {
        Color.white
            .ignoresSafeArea()
        VStack {
            Spacer()
            TabBarView(selectedTab: .constant(.home))
        }
    }
}
