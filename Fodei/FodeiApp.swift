//
//  FodeiApp.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

@main
struct FodeiApp: App {
    var body: some Scene {
        WindowGroup {
            ScreenFactory.makeOnBoarding()
        }
    }
}
