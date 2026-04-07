//
//  WelcomeViewModel.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//
import SwiftUI
import Combine

@Observable final class WelcomeViewModel {
    var selectedTab: Int = 0
    var showScreen: Bool = false
    
    func openRegistration(tab: Int) {
        selectedTab = tab
        showScreen = true
    }
}
