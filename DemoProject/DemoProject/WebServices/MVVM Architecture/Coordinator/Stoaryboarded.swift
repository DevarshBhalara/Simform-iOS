//
//  Stoaryboarded.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
import UIKit

enum Storyboard: String {
    case authentication = "Authentication"
    case home = "Home"
    case viper = "Viper"
}

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}


extension Storyboarded where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        
        let fullName = NSStringFromClass(self)
        
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
