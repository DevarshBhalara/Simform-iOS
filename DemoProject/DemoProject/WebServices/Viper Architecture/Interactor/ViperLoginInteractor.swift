//
//  ViperLoginInteractor.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/06/23.
//

import Foundation
class ViperLoginInteractor {
    static let shared = ViperLoginInteractor()
    
    private init() { }
    
    let user = ViperLoginRequest(email: "devarsh@gmail.com", password: "12345")
    
    func performLogin(credential: ViperLoginRequest, complition: @escaping (Result<ViperLoginResponseMVP, Error>) -> Void ) {
        if credential.email == user.email && credential.password == user.password {
            complition(.success(ViperLoginResponseMVP(email: user.email, token: UUID().uuidString)))
        } else {
            complition(.failure(CustomError(title: "AppName", body: "Invalid Email or Password")))
        }
    }
}
