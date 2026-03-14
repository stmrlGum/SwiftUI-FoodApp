//
//  FodeiApp.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

@main
struct FodeiApp: App {
    @AppStorage("isShowOnBoarding") var isShowOnBoarding: Bool = false
    var body: some Scene {
        WindowGroup {
            if isShowOnBoarding {
                ScreenFactory.makeWelcome()
            } else {
                ScreenFactory.makeOnBoarding()
            }
        }
    }
}
