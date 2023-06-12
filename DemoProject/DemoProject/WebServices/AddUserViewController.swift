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
        registerUser(user: UserRegister(email: "eve.holt@reqres.in", password: "pistol"))
    }
    
    func registerUser(user: UserRegister) {
        if let url = URL(string: "https://reqres.in/api/register") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let error {
                print("Error \(error)")
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, urlReponse, error in
                
                if let error = error {
                    print("Erro : \(error)")
                }
                
                guard let responseData = data else {
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(RegisterResponse.self, from: responseData)
                    print("id \(userResponse.id)")
                    print("id \(userResponse.token)")
                } catch let error {
                    print("error in decode : \(error)")
                }
                
            })
            dataTask.resume()
        }
    }

}
