//
//  Authentication.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
struct LoginRequest {
    var email: String
    var password: String
}

struct LoginResponseMVP {
    var email: String
    var token: String
}
