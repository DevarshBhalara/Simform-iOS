//
//  LoginAlamoFireViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import UIKit

class LoginAlamoFireViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var loginCard: UIView!
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    
    //MARK: - Variables
    private var logInViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginCard.layer.cornerRadius = 10
        bindViewModel()
        bindSignInUi()
    
    }
    
    private func bindViewModel() {
        logInViewModel.validationError.bind { [weak self]
            (message: String) in
            self?.showAlertDialog(message: message)
        }
    }
    
    private func bindSignInUi() {
        logInViewModel.signInSuccess.bind { [weak self] in
            self?.showAlertDialog(message: "Welcome to our app")
        }
        
        logInViewModel.error.bind { [weak self]
            _ in
            self?.showAlertDialog(message: "Invalid User name or Password")
        }
    }

    @IBAction func btnLoginClick(_ sender: Any) {
        if let email = tfEmail.text, let password = tfPassword.text {
            logInViewModel.validData(email: email, password: password)
            
        }
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}
