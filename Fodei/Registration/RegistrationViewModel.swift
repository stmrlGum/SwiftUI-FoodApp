//
//  RegistrationViewModel.swift
//  Fodei
//
//  Created by Danil on 13.03.2026.
//

import SwiftUI
import Combine

final class RegistrationViewModel: ObservableObject {
    
    @Published var createAccountModel = CreateAccountModel(
        fullName: "",
        username: "",
        password: ""
    )
    
    @Published var loginModel = LoginModel(
        username: "",
        password: ""
    )
    
    @Published var selected: Int
    @Published var showSheet: Bool = false
    
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
    }
    
    func login() {
        print("login:", loginModel.username, loginModel.password)
    }
    
    func forgotPassword() {
        print("forgot password")
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
