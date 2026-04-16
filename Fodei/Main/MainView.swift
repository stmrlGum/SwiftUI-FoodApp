//
//  MainView.swift
//  Fodei
//
//  Created by Danil on 24.03.2026.
//

import SwiftUI

struct MainView: View {
    
    @State var viewModel: MainViewModel
    @State private var selectedTab: TabBarEnums = .home
    
    init(viewModel: MainViewModel) {
        UITabBar.appearance().isHidden = true
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: -10) {
                TabView(selection: $selectedTab) {
                    ScreenFactory.makeHomeView()
                        .tag(TabBarEnums.home)
                        .toolbar(.hidden, for: .navigationBar)
                    ScreenFactory.makeBooking { item in
                        viewModel.bookingItem = item
                        viewModel.isShowBookingDetail = true
                    }
                    .tag(TabBarEnums.booking)
                    .toolbar(.hidden, for: .navigationBar)
                    ScreenFactory.makeProfile()
                        .tag(TabBarEnums.profile)
                        .toolbar(.hidden, for: .navigationBar)
                }
                TabBarView(selectedTab: $selectedTab)
            }
            .navigationDestination(isPresented: $viewModel.isShowBookingDetail) {
                if let item = viewModel.bookingItem {
                    ScreenFactory.makeBookingDetail(bookingItem: item)
                        .onDisappear {
                            viewModel.isShowBookingDetail = false
                        }
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        }
    }
}

#Preview {
    ScreenFactory.makeMain()
}
