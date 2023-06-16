//
//  LoginViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
class LoginViewModel {
    
    init() { }
    
    //MARK: - Variables
    let validationError = Dynamic<String>("")
    let error = Dynamic<String>("")
    let signInSuccess = Dynamic<Void>(())
    
    func validData(email: String, password: String) {
        var error = false
        
        if email.isEmpty {
            self.validationError.value = "Please enter Email id!"
            error = true
        } else if password.isEmpty {
            self.validationError.value = "Please enter Password!"
            error = true
        }
        
        if !error {
            self.callSignInApi(email: email, password: password)
        }
    }
    
    func callSignInApi(email: String, password: String) {
        let model = LoginRequestModel(email: email, password: password)
        print("param \(model.requestParam())")
        APIManagerDemo.shared.call(type: .login, params: model.requestParam()) {
            [weak self] (result: Result<LoginResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("VM : \(response)")
                self?.signInSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
            }

        }
     }
    
}
