//
//  DeleteUserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/06/23.
//

import UIKit

class DeleteUserViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfDeleteId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnDelete(_ sender: UIButton) {
        APIManager.shared.callAPI(urlString: "https://reqres.in/api/users/\(tfDeleteId.text ?? "0")", requestMethod: .delete) { [weak self]
            (result: Result<DeleteResponse, Error>) in
            
            switch result {
            case .success(let response):
                print("\(response.code ?? 0)")
                DispatchQueue.main.async {
                    self?.showAlertDialog(id: Int(self?.tfDeleteId.text ?? "0") ?? 0)
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    //Show dialog for delete
    private func showAlertDialog(id: Int) {
        let alert = UIAlertController(title: "Deleted Successfull", message: "User with id \(id) deleted Successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
