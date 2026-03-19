//
//  ScreenFactory.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//


struct ScreenFactory {
    static func makeOnBoarding() -> OnBoardingView {
        let vm = OnBoardingViewModel()
        return OnBoardingView(viewModel: vm)
    }
    
    static func makeWelcome() -> WelcomeView {
        let vm = WelcomeViewModel()
        return WelcomeView(viewModel: vm)
    }
    
    static func makeRegistration(selected: Int) -> RegistrationView {
        let vm = RegistrationViewModel(selected: selected)
        return RegistrationView(viewModel: vm)
    }
}
