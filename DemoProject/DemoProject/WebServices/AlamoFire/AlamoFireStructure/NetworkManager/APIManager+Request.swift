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
    case uploadImage
    case getProduct(id: Int)
}

extension RequestItemsType {
    
    var baseURL: String {
        switch self {
        case .login:
            return "https://reqres.in/"
        case .signUp, .getUser, .updateUser:
            return "https://648c3d218620b8bae7ec85b9.mockapi.io/"
        case .uploadImage :
            return "https://api.imgbb.com/"
        case .getProduct(_) :
            return "https://fakestoreapi.com/"
        }
        
    }
    
    
    
    
    var api: String {
        switch self {
        case .getUser, .login, .signUp, .updateUser:
            return "api/"
        case .uploadImage:
            return "1/"
        case .getProduct(_):
            return "products/"
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .signUp, .getUser, .updateUser:
            return "users"
        case .uploadImage:
            return "upload"
        case .getProduct(let id):
            return "\(id)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login, .signUp, .uploadImage:
            return .post
        case .getUser:
            return .get
        case .updateUser:
            return .put
        case .getProduct(_):
            return .get
        }
    }
    
    var url: URL {
        switch self {
        case .signUp, .login, .getProduct(_):
            return URL(string: self.baseURL + self.api + self.path)!
        case .getUser, .updateUser:
            return URL(string: self.baseURL + self.api + self.path + "/" + UserDefaults.standard.string(forKey: "userid")! )!
        case .uploadImage:
            return URL(string: self.baseURL + self.api + self.path + "?" + "key=f8fe9a449ea4b2a9b7387b9e0d3d59c7")!
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .signUp, .login, .getUser, .updateUser, .uploadImage, .getProduct(_) :
            return JSONEncoding.default
        }
    }
}
