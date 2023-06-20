//
//  AuthenticationService.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
class AutheticationService {
    
    static let shared = AutheticationService()
    
    private init() { }
    
    let user = LoginRequest(email: "devarsh@gmail.com", password: "12345")
    
    func performLogin(credential: LoginRequest, complition: @escaping (Result<LoginResponseMVP, Error>) -> Void ) {
        if credential.email == user.email && credential.password == user.password {
            complition(.success(LoginResponseMVP(email: user.email, token: UUID().uuidString)))
        } else {
            complition(.failure(CustomError(title: "AppName", body: "Invalid Email or Password")))
        }
    }
}
