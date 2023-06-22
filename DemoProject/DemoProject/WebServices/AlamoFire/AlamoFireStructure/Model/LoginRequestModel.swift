//
//  LoginRequestModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
struct LoginRequestModel: Codable {
    let email: String
    let password: String
    
    func requestParam() -> [String: Any] {
        var requestParam: [String: Any] = [:]
        requestParam["email"] = email
        requestParam["password"] = password
        return requestParam
    }
}

struct LoginResponse: Codable {
    let token: String
}
