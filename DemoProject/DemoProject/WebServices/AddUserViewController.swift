//
//  AddUserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 12/06/23.
//

import UIKit

class AddUserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnAddUser(_ sender: UIButton) {
        ///Call function for post request
//        registerUser(user: UserRegister(email: "eve.holt@reqres.in", password: "pistol"))

        registerUserWithApiManager(user: UserRegister(email: "eve.holt@reqres.in", password: "pistol"))
    }
    
    ///post Request using ApiManager class
    func registerUserWithApiManager(user: UserRegister) {
 
        APIManager.shared.callAPI(urlString: "https://reqres.in/api/register", requestMethod: "POST", parameter: user) { [weak self]
            (result: Result<RegisterResponse, Error>) in
            
            switch result {
            case .success(let responese):
                print("id \(String(describing: responese.id))")
                print("id \(responese.token ?? "")")
                DispatchQueue.main.async {
                    self?.showAlertDialog(id: responese.id ?? 0, token: responese.token ?? "N/A")
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
