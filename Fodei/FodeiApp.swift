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
    @State private var path = NavigationPath()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                Group {
                    if isShowOnBoarding {
                        ScreenFactory.makeMain()
                    } else {
                        ScreenFactory.makeOnBoarding(path: $path)
                    }
                }
                .navigationDestination(for: OnBoardingRoute.self) { route in
                    switch route {
                    case .welcome:
                        ScreenFactory.makeWelcome(path: $path)
                    case .main:
                        ScreenFactory.makeMain()
                    }
                }
            }
        }
    }
}
