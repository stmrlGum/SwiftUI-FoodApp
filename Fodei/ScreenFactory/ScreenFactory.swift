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
        let vm = MainViewModel()
        return MainView(viewModel: vm)
    }
    
    static func makeHomeView() -> HomeView {
        let vm = HomeViewModel()
        return HomeView(viewModel: vm)
    }
    
    static func makeMap(routeCoordinates: CLLocationCoordinate2D) -> MapView {
        let vm = MapViewModel(routeCoordinates: routeCoordinates)
        return MapView(viewModel: vm)
    }
    
    static func makeBooking(onDetailOpen: @escaping (BookingItemModel) -> Void) -> BookingView {
        let vm = BookingViewModel()
        return BookingView(viewModel: vm,
                           onDetailOpen: onDetailOpen
        )
    }
    
    static func makeBookingDetail(bookingItem: BookingItemModel) -> BookingDetailView {
        let vm = BookingDetailViewModel(bookingItem: bookingItem)
        return BookingDetailView(viewModel: vm)
    }
    
    static func makeProfile() -> ProfileView {
        let vm = ProfileViewModel()
        return ProfileView(viewModel: vm)
    }
}
