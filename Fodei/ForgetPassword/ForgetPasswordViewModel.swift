//
//  ForgetPasswordViewModel.swift
//  Fodei
//
//  Created by Danil on 19.03.2026.
//

import Foundation
import Combine

@Observable final class ForgetPasswordViewModel {
    
    var email = ""
    var showNext = false
    
    var isEmailValid: Bool {
        !email.isEmpty
    }
    
    func submitEmail() {
        showNext = true
        print("submited email: \(email)")
    }
}

