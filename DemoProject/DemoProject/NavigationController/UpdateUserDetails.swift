//
//  UpdateUserDetails.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import Foundation
struct UpdateUserDetails {
        
    static let updateUserDetails = UpdateUserDetails()
    private let userDefault = UserDefaults.standard
    
    func isLoggedIn() -> Bool {
        return (userDefault.string(forKey: "userId") != nil)
    }
    
    func saveDetails(name: String, password: String) {
        userDefault.set(UUID().uuidString, forKey: "userId")
        userDefault.set(name, forKey: "userName")
        userDefault.set(password, forKey: "password")
    }
    
    func removeDetails() {
        userDefault.removeObject(forKey: "userId")
        userDefault.removeObject(forKey: "userName")
        userDefault.removeObject(forKey: "password")
    }
    
    func getUserName() -> String {
        userDefault.string(forKey: "userName") ?? "NA"
    }
    
}
