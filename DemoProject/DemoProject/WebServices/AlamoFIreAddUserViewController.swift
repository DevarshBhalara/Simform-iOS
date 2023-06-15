//
//  AlamoFIreAddUserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 15/06/23.
//

import UIKit

class AlamoFIreAddUserViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addBtnClick(_ sender: Any) {
        registerUser(user: UserRegister(email: tfEmail.text ?? "", password: tfPassword.text ?? ""))
    }
    
    func registerUser(user: UserRegister) {
        let parameter = ["email": user.email,
                         "password": user.password
                        ]
        ApiManagerAF.shared.callAPI(urlString: "https://reqres.in/api/register", method: .post, parameter: parameter) {
            (result: Result<RegisterResponse, Error>) in
            
            switch result {
            case .success(let response):
                print("id \(String(describing: response.id))")
                print("id \(response.token ?? "")")
                
                DispatchQueue.main.async {
                    self.showAlertDialog(id: response.id ?? 0, token: response.token ?? "N/A")
                }
            case .failure(let error):
                print("Error \(error)")
            
            }
        }
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(id: Int, token: String) {
        let alert = UIAlertController(title: "Registration Successfull", message: "id: \(id), Token: \(token)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
