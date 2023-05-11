//
//  LoginNavigationViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 04/05/23.
//

import UIKit

class LoginNavigationViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblUserNamePasswordWrong: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        if tfUserName.text == "devarsh" && tfPassword.text == "devarsh" {
            lblUserNamePasswordWrong.isHidden = true
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "TabbarNavigation") else {
                return
            }
            
            UpdateUserDetails.updateUserDetails.saveDetails(name: tfUserName.text ?? "", password: tfPassword.text ?? "")
            navigationController?.modalPresentationStyle = .fullScreen
            navigationController?.modalTransitionStyle = .flipHorizontal
            if navigationController != nil {
                navigationController?.present(viewController, animated: true)
            } else {
                dismiss(animated: true)
            }
            
        } else {
            lblUserNamePasswordWrong.isHidden = false
        }
    }
    
}
