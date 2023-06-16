//
//  RegisterUserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import UIKit

class RegisterUserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfState: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var loginCard: UIView!
    @IBOutlet weak var tfMobileNumber: UITextField!
    
    //MARK: - Variable
    let viewModel: RegisterViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindSignUpUi()
        loginCard.layer.cornerRadius = 10
    }
    
    private func bindViewModel() {
        viewModel.validationError.bind {
            message in
            self.showAlertDialog(message: message)
        }
    }
    
    private func bindSignUpUi() {
        viewModel.error.bind {
            message in
            print("Error \(message)")
            self.showAlertDialog(message: "Server side Error")
        }
        
        viewModel.signUpSuccess.bind {
            message in
            print(message)
            self.showAlertDialog(message: "Welcome to our App \(message)")
        }
    }
    
    @IBAction func btnSignUpClick(_ sender: Any) {
        if let name = tfName.text, let email = tfEmail.text, let number = tfMobileNumber.text, let state = tfState.text {
            viewModel.validateData(email: email, number: number, state: state, name: name)
        }
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {
            _ in
            
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateUserDataViewController") {
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }))
        self.present(alert, animated: true)
    }
}
