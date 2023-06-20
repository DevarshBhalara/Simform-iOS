//
//  LoginPresenter.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
class LoginPresenter {
    
    weak var delegate: LoginData?
    
    func validate(email: String, password: String) {
        if email.isEmpty {
            self.delegate?.loginValdiationFail(error: "Please Enter email")
        } else if password.isEmpty {
            self.delegate?.loginValdiationFail(error: "Please enter Passoword")
        } else {
            callLogin(user: LoginRequest(email: email, password: password))
        }
    }
    
    func callLogin(user: LoginRequest) {
        AutheticationService.shared.performLogin(credential: user) { (result: Result<LoginResponseMVP, Error>) in
            switch result {
            case .success(let res):
                self.delegate?.loginSuccess(userData: res)
            case .failure(_):
                self.delegate?.loginFail(error: "Invalid Email or password")
            }
        }
    }
}

protocol LoginData: AnyObject {
    func loginSuccess(userData: LoginResponseMVP)
    func loginFail(error: String)
    func loginValdiationFail(error: String)
}
