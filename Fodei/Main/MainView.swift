//
//  MainView.swift
//  Fodei
//
//  Created by Danil on 24.03.2026.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: TabBarEnums = .home
    var body: some View {
        ZStack {
            Color.white
                    .ignoresSafeArea()
            switch selectedTab {
            case .home:
                Color.blue
            case .booking:
                Color.green
            case .profile:
                Color.cyan
            }
            VStack {
                Spacer()
                TabBarView(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}
#Preview {
    MainView()
}
