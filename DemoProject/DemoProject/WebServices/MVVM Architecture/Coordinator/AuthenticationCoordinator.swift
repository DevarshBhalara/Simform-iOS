//
//  AuthenticationCoordinator.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import Foundation
import UIKit

class AuthenticationCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC = LoginVC.instantiate(from: .authentication)
        loginVC.coordinator = self
        self.navigationController.pushViewController(loginVC, animated: true)
    }
    
    func goToSignUp() {
        let signUpVC = SignUPVC.instantiate(from: .authentication)
        signUpVC.coordinator = self
        self.navigationController.pushViewController(signUpVC, animated: true)
    }
    
    func gotToHome() {
    
        if let appCoordinator = UserManager.shared.sceneDelegate?.appCoordinator {
            appCoordinator.goToHome()
        }
    }
    
    
}
