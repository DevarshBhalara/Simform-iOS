//
//  LoginMVPVC.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import UIKit

class LoginMVPVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfEmail: UITextField!
    
    //MARK: - Variable
    let loginPresenter = LoginPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginPresenter.delegate = self
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        loginPresenter.validate(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }

}

//MARK: Login Protocol
extension LoginMVPVC: LoginData {
    func loginValdiationFail(error: String) {
        self.showAlertDialog(message: error)
    }
    
    func loginSuccess(userData: LoginResponseMVP) {
        self.showAlertDialog(message: "Login Successfully token: \(userData.token)")
    }
    
    func loginFail(error: String) {
        self.showAlertDialog(message: "Invalid email or password!")
    }
    
    
}

