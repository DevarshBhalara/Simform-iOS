//
//  VIperPresenter.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/06/23.
//

import UIKit
import Foundation
class ViperPresenter {
    
    weak var delegate: ViperLoginData?
    var route: ViperHomeRouteNavigation
    
    init(navigationController: UINavigationController) {
        self.route = ViperHomeRouteNavigation(navigationController: navigationController)
    }
        
    func validate(email: String, password: String) {
        if email.isEmpty {
            self.delegate?.loginValdiationFail(error: "Please Enter email")
        } else if password.isEmpty {
            self.delegate?.loginValdiationFail(error: "Please enter Passoword")
        } else {
            callLogin(user: ViperLoginRequest(email: email, password: password))
        }
    }
    
    func callLogin(user: ViperLoginRequest) {
        ViperLoginInteractor.shared.performLogin(credential: user) { (result: Result<ViperLoginResponseMVP, Error>) in
            switch result {
            case .success(let res):
                self.delegate?.loginSuccess(userData: res)
                self.route.gotoHome()
            case .failure(_):
                self.delegate?.loginFail(error: "Invalid Email or password")
            }
        }
    }
}

protocol ViperLoginData: AnyObject {
    func loginSuccess(userData: ViperLoginResponseMVP)
    func loginFail(error: String)
    func loginValdiationFail(error: String)
}


