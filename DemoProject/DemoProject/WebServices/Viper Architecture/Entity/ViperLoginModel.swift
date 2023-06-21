//
//  ViperLoginModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/06/23.
//

import Foundation
struct ViperLoginRequest {
    var email: String
    var password: String
}

struct ViperLoginResponseMVP {
    var email: String
    var token: String
}
