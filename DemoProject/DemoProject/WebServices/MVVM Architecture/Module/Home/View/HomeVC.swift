//
//  HomeVC.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import UIKit

class HomeVC: UIViewController, Storyboarded {
    
    //MARK: - Variables
    var coordinator: HomeCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logout))
    }
    
    @objc func logout() {
        if let appCoordinator = UserManager.shared.sceneDelegate?.appCoordinator {
            appCoordinator.logout()
            UserManager.shared.isUserLogin = false
        }
    }

}
