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
        ApiManager.request(urlString: "https://reqres.in/api/register", requestType: "POST", parameter: user, completion: {
            result in

            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(RegisterResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.showAlertDialog(id: userResponse.id ?? 0, token: userResponse.token ?? "")
                    }
                } catch let error {
                    print("Error in response \(error)")
                }
            case .failure(_):
                print("Fail to get Data")
            }
        })
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(id: Int, token: String) {
        let alert = UIAlertController(title: "Registration Successfull", message: "id: \(id), Token: \(token)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    ///post request using URLSession
//    func registerUser(user: UserRegister) {
//        if let url = URL(string: "https://reqres.in/api/register") {
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "POST"
//
//            do {
//                urlRequest.httpBody = try JSONEncoder().encode(user)
//            } catch let error {
//                print("Error \(error)")
//            }
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//
//            let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, urlReponse, error in
//
//                if let error = error {
//                    print("Erro : \(error)")
//                }
//
//                guard let responseData = data else {
//                    return
//                }
//
//                do {
//                    let decoder = JSONDecoder()
//                    let userResponse = try decoder.decode(RegisterResponse.self, from: responseData)
//                    print("id \(String(describing: userResponse.id))")
//                    print("id \(userResponse.token ?? "")")
//                } catch let error {
//                    print("error in decode : \(error)")
//                }
//
//            })
//            dataTask.resume()
//        }
//    }

}
