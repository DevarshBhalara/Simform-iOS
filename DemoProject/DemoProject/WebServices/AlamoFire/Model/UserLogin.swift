//
//  UserLogin.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import Foundation
struct UserLogin: Codable {
    let username: String
    let password: String
}

struct UserLoginResponse: Codable {
    let token: String
}
