//
//  LoginViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    @IBOutlet private weak var loginCard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }
    
    private func setUpUi() {
        loginCard.layer.cornerRadius = 10
    }

    @IBAction func btnLoginClick(_ sender: Any) {
        loginUser(user: UserLogin(username: tfEmail.text ?? "" , password: tfPassword.text ?? ""))
    }
    
    private func loginUser(user: UserLogin) {
        let parameter = [
            "username": user.username,
            "password": user.password
        ]
        ApiManagerAF.shared.callAPI(urlString: ApiManagerAF.shared.storeUrlLogin, method: .post, parameter: parameter) { [weak self]
            (result: Result<UserLoginResponse, Error>) in
            
            switch result {
            case .success(_):
                if let viewController = self?.storyboard?.instantiateViewController(withIdentifier: "AllProductViewController") {
                    self?.navigationController?.pushViewController(viewController, animated: true)
                }
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
}
