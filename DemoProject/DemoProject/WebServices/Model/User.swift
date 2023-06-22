//
//  User.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/06/23.
//

import Foundation
struct UserList: Codable {
    var page: Int = 0
    var per_page: Int = 0
    var total: Int = 0
    var total_pages: Int = 0
    var data: [User] = []
}

struct User: Codable {
    var id: Int = 0
    var email: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var avatar: String = ""

}

struct UserRegister: Codable {
    let email: String
    let password: String
}

struct RegisterResponse: Codable {
    let id: Int?
    let token: String?
}
