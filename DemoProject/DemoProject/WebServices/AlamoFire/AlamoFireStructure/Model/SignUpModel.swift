//
//  SignUpModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
struct SignUp: Codable {
    let name: String
    let email: String
    let mobilenumber: String
    let state: String
    let avatar: String
    
    func requestParameter() -> [String: Any] {
        var param: [String: Any] = [:]
        
        param["name"] = name
        param["email"] = email
        param["mobilenumber"] = mobilenumber
        param["state"] = state
        param["avatar"] = avatar
        return param
    }
}

struct SignUpResponse: Codable {
    let createdAt, name: String
    let avatar: String
    let email, mobilenumber, state, id: String
}

struct GetUserResponse: Codable {
    let createdAt, name: String?
    let avatar: String?
    let email, mobilenumber, state, id: String?
}


