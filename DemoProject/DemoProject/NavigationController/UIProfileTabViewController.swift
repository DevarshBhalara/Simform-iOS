//
//  UIProfileTabViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 04/05/23.
//

import UIKit

class UIProfileTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnLogoutClicked(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigationViewController") else {
            return
        }
        UpdateUserDetails.updateUserDetails.removeDetails()
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.modalTransitionStyle = .flipHorizontal
        navigationController?.present(viewController, animated: true)
    }
}
