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
        viewModel.onValidationError.bind {
            message in
            print(message)
        }
        
        viewModel.onAPIError.bind {
            message in
            print(message)
        }
        
        viewModel.onLoginSuccess.bind {
            print("Successss Login")
            self.coordinator?.gotToHome()
        }
    }

    @IBAction func onClickLogin(_ sender: UIButton) {
        viewModel.validatedData(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
    }
    
    @IBAction func onClickSignUp(_ sender: UIButton) {
        coordinator?.goToSignUp()
    }
    
}
