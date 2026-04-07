//
//  MainView.swift
//  Fodei
//
//  Created by Danil on 24.03.2026.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: TabBarEnums = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: -10) {
            TabView(selection: $selectedTab) {
                ScreenFactory.makeHomeView()
                    .tag(TabBarEnums.home)
                ScreenFactory.makeBooking()
                    .tag(TabBarEnums.booking)
                Color.cyan
                    .tag(TabBarEnums.profile)
            }
            TabBarView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    MainView()
}
