//
//  ViperHomeRoute.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/06/23.
//

import Foundation
import UIKit
class ViperHomeRouteNavigation {
    
    var navigationContreoller = UINavigationController()
    
    init(navigationController: UINavigationController) {
        self.navigationContreoller = navigationController
    }
    
    func gotoHome() {
        let homeVC = ViperHomeVC.instantiate(from: .viper)
        self.navigationContreoller.pushViewController(homeVC, animated: true)
    }
}
