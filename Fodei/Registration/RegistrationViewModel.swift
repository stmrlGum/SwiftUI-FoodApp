//
//  RegistrationViewModel.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI
import Combine

@Observable final class RegistrationViewModel {
    private enum StorageKeys {
        static let isShowOnBoarding = "isShowOnBoarding"
        static let isRegistered = "isRegistered"
    }
    
    var createAccountModel = CreateAccountModel(
        fullName: "",
        username: "",
        password: ""
    )
    
    var loginModel = LoginModel(
        username: "",
        password: ""
    )
    
    var selected: Int
    var showSheet: Bool = false
    var isForgotPresented: Bool = false
    var onMain: (() -> Void)?
    
    init(selected: Int) {
        self.selected = selected
    }
    
    var isCreateAccountValid: Bool {
        !createAccountModel.fullName.isEmpty &&
        !createAccountModel.username.isEmpty &&
        !createAccountModel.password.isEmpty
    }
    
    var isLoginValid: Bool {
        !loginModel.username.isEmpty &&
        !loginModel.password.isEmpty
    }
    
    func register() {
        print("register:", createAccountModel.fullName, createAccountModel.username, createAccountModel.password)
        UserDefaults.standard.set(true, forKey: StorageKeys.isShowOnBoarding)
        UserDefaults.standard.set(true, forKey: StorageKeys.isRegistered)
        onMain?()
    }
    
    func login() {
        print("login:", loginModel.username, loginModel.password)
        UserDefaults.standard.set(true, forKey: StorageKeys.isShowOnBoarding)
        UserDefaults.standard.set(true, forKey: StorageKeys.isRegistered)
        onMain?()
    }
    
    func forgotPassword() {
        print("forgot password")
        isForgotPresented = true
    }
    
    func selectTab(_ index: Int) {
        selected = index
    }
    
    func closeSheet(completion: @escaping () -> Void) {
        showSheet = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            completion()
        }
    }
}
