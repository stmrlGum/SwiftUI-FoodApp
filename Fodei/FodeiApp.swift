//
//  FodeiApp.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

@main
struct FodeiApp: App {
    @State private var path = NavigationPath()
    @AppStorage("isShowOnBoarding") private var isShowOnBoarding: Bool = false
    @AppStorage("isRegistered") private var isRegistered: Bool = false
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                Group {
                    if isShowOnBoarding {
                        if isRegistered {
                            ScreenFactory.makeMain()
                        } else {
                            ScreenFactory.makeWelcome(path: $path)
                        }
                        
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
