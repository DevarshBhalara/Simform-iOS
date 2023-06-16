//
//  UpdateUserViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
class UpdateUserViewModel{

    //MARK: - variable
    var error = Dynamic<String>("")
    var getUser = Dynamic<GetUserResponse?>(nil)
    var updateSuccess = Dynamic<Void>(())
    var validationError = Dynamic<String>("")
    
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
            self.callUpdateApi(email: email, number: number, state: state, name: name)
        }
        
    }
    
    func getUserData() {
        APIManagerDemo.shared.call(type: .getUser) { [weak self]
            (result: Result<GetUserResponse, CustomError>) in
            
            switch result {
            case .success(let user):
                print("User \(user)")
                self?.getUser.value = user
                self?.updateSuccess.fire()
            case .failure(let error):
                print(error.body)
                self?.error.value = error.body
            }
        }
    }
    
    func callUpdateApi(email: String, number: String, state: String, name: String) {
        let param = SignUp(name: name, email: email, mobilenumber: number, state: state)
        APIManagerDemo.shared.call(type: .updateUser, params: param.requestParameter()) { [weak self]
            (result: Result<GetUserResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("Updated \(response)")
                self?.updateSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
            }
        }
    }
}
