//
//  RegisterViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
class RegisterViewModel {
    
    //MARK: - Variables
    let error = Dynamic<String>("")
    let signUpSuccess = Dynamic<String>("")
    let validationError = Dynamic<String>("")
    
    func validateData(email: String, number: String, state: String, name: String) {
        var error = false
        if email.isEmpty {
            self.validationError.value = "Please enter email!"
            error = true
        } else if number.isEmpty {
            self.validationError.value = "please enter NUmber!"
            error = true
        } else if state.isEmpty {
            self.validationError.value = "Please enter State"
            error = true
        } else if name.isEmpty {
            self.validationError.value = "Please enter Name!"
            error = true
        }
        
        if !error {
            self.callSignUpApi(email: email, number: number, state: state, name: name)
        }
        
            
    }
    
    func getUser(id: String) {
        APIManagerDemo.shared.call(type: .signUp) { [weak self]
            (result: Result<SignUpResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("Sign up response \(response)")
                self?.signUpSuccess.value = response.id
                self?.signUpSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
            }
        }
    }
    
    func callSignUpApi(email: String, number: String, state: String, name: String) {
        let param = SignUp(name: name, email: email, mobilenumber: number, state: state)
        APIManagerDemo.shared.call(type: .signUp, params: param.requestParameter()) { [weak self]
            (result: Result<SignUpResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("Sign up response \(response)")
                UserDefaults.standard.set(response.id, forKey: "userid")
                self?.signUpSuccess.value = response.id
                self?.signUpSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
            }
        }
    }
    
}
