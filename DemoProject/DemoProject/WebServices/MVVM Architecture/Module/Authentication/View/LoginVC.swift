//
//  LoginVC.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/06/23.
//

import UIKit

class LoginVC: UIViewController, Storyboarded {
    
    //MARK: - Variables
    var coordinator : AuthenticationCoordinator?
    var viewModel = LoginViewModelCoordinator()
    
    //MARK: Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.onValidationError.bind { [weak self] 
            message in
            self?.showAlertDialog(message: message)
        }
        
        viewModel.onAPIError.bind { [weak self]
            message in
            self?.showAlertDialog(message: message)
        }
        
        viewModel.onLoginSuccess.bind { [weak self] in
            print("Successss Login")
            self?.coordinator?.gotToHome()
        }
        
       
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "AppName", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }

    @IBAction func onClickLogin(_ sender: UIButton) {
        viewModel.validatedData(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
    }
    
    @IBAction func onClickSignUp(_ sender: UIButton) {
        coordinator?.goToSignUp()
    }
    
}
