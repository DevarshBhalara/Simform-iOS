//
//  APIManager+Request.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
import Alamofire

//MARK: - Enums
enum RequestItemsType: Equatable {
    
    case login
    case signUp
    case getUser
    case updateUser
}

extension RequestItemsType {
    
    var baseURL: String {
        switch self {
        case .login:
            return "https://reqres.in/"
        case .signUp, .getUser, .updateUser:
            return "https://648c3d218620b8bae7ec85b9.mockapi.io/"
        }
        
    }
    
    
    var api: String {
        return "api/"
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .signUp, .getUser, .updateUser:
            return "users"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        case .getUser:
            return .get
        case .updateUser:
            return .put
        }
    }
    
    var url: URL {
        switch self {
        case .signUp, .login:
            return URL(string: self.baseURL + self.api + self.path)!
        case .getUser, .updateUser:
            return URL(string: self.baseURL + self.api + self.path + "/" + UserDefaults.standard.string(forKey: "userid")! )!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .signUp, .login, .getUser, .updateUser :
            return JSONEncoding.default
        }
    }
}
