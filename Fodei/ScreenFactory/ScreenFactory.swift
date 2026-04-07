//
//  ScreenFactory.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI
import CoreLocation

struct ScreenFactory {
    static func makeOnBoarding(path: Binding<NavigationPath>) -> OnBoardingView {
        let vm = OnBoardingViewModel()
        return OnBoardingView(path: path, viewModel: vm)
    }
    
    static func makeWelcome(path: Binding<NavigationPath>) -> WelcomeView {
        let vm = WelcomeViewModel()
        return WelcomeView(path: path, viewModel: vm)
    }
    
    static func makeRegistration(selected: Int, onDismiss: @escaping () -> Void) -> RegistrationView {
        let vm = RegistrationViewModel(selected: selected)
        return RegistrationView(
            viewModel: vm,
            onDismiss: onDismiss
        )
    }
    
    static func makeForgetPassword() -> ForgetPasswordView {
        let vm = ForgetPasswordViewModel()
        return ForgetPasswordView(viewModel: vm)
    }
    
    static func makeMain() -> MainView {
        return MainView()
    }
    
    static func makeHomeView() -> HomeView {
        let vm = HomeViewModel()
        return HomeView(viewModel: vm)
    }
    
    static func makeMap(routeCoordinates: CLLocationCoordinate2D) -> MapView {
        let vm = MapViewModel(routeCoordinates: routeCoordinates)
        return MapView(viewModel: vm)
    }
    
    static func makeBooking() -> BookingView {
        let vm = BookingViewModel()
        return BookingView(viewModel: vm)
    }
}
