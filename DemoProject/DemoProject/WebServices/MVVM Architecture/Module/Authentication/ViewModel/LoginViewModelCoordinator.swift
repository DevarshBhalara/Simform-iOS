//
//  LoginViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
class LoginViewModelCoordinator {
    
    var onValidationError = Dynamic<String>("")
    var onAPIError = Dynamic<String>("")
    var onLoginSuccess = Dynamic<Void>(())
    
    func validatedData(email: String, password: String) {
        if email.isEmpty {
            onValidationError.value = "Email is Empty"
        } else if password.isEmpty {
            onValidationError.value = "Password is Empty"
        } else {
            performLogin(email: email, password: password)
        }
    }
    
    func performLogin(email: String, password: String) {
        
        if email == "devarsh@gmail.com" && password == "devarsh123" {
            UserManager.shared.isUserLogin = true
            onLoginSuccess.fire()
        } else {
            onAPIError.value = "Invalid Email and Password"
            onAPIError.fire()
        }
    }
}
