//
//  ViperLoginVC.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/06/23.
//

import UIKit

class ViperLoginVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    //MARK: Variables
    var coordinator: ViperHomeRouteNavigation?
    var presenter: ViperPresenter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        if let navigationController = navigationController{
                presenter = ViperPresenter(navigationController: navigationController)
        }
        presenter?.delegate = self
    }

    @IBAction func btnLoginClick(_ sender: UIButton) {
        presenter?.validate(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ViperLoginVC: ViperLoginData {
    func loginSuccess(userData: ViperLoginResponseMVP) {
        self.showAlertDialog(message: "Login Success")
    }
    
    func loginFail(error: String) {
        self.showAlertDialog(message: error)
    }
    
    func loginValdiationFail(error: String) {
        self.showAlertDialog(message: error)
    }
    
    
}
