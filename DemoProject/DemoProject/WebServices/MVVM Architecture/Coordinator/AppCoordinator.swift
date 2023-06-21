//
//  AppCoordinator.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        if UserManager.shared.isUserLogin {
            goToHome()
        } else {
            goToLogin()
        }
    }
    
    func goToLogin() {
        let authCoordinator = AuthenticationCoordinator(navigationController: navigationController)
        authCoordinator.start()
    }
    
    func logout() {
        goToLogin()
    }
    
    
    func goToHome() {
        let homeCoordinator = HomeCoordinator(navigationController: navigationController)
//        self.window.rootViewController = navigationController
        homeCoordinator.start() 
    }
    
    
}
