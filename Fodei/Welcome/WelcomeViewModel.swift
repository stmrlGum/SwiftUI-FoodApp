//
//  WelcomeViewModel.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import Combine

final class WelcomeViewModel: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var showScreen: Bool = false
    
    func openRegistration(tab: Int) {
        selectedTab = tab
        showScreen = true
    }
}
