//
//  UserManager.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
import UIKit

struct Keys {
    static let isUserLogin = "isUserLogin"
}

class UserManager: NSObject {
    
    private override init() {
        
    }
    static let shared = UserManager()
    
    var isUserLogin: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isUserLogin)
        } set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.isUserLogin)
            UserDefaults.standard.synchronize()
        }
    }
    
    var sceneDelegate: SceneDelegate? {
        return UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    }
}
