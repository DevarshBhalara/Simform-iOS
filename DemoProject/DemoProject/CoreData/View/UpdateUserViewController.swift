//
//  UpdateUserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 28/07/23.
//

import UIKit

class UpdateUserViewController: UIViewController {
    
    // MARK: - outlets
    @IBOutlet weak var tfUserEmail: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfNumber: UITextField!
    
    // MARK: - variables
    var user: UserCoreData?
    var complition: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let user = user {
            tfUserName.text = user.username
            tfNumber.text = user.mobilenumber
            tfUserEmail.text = user.email
            tfPassword.text = user.password
        }
    }
    
    @IBAction func btnUpdateAction(_ sender: UIButton) {
        if let user = user {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            user.mobilenumber = tfNumber.text
            user.username = tfUserName.text
            user.email = tfUserEmail.text
            
            do {
                try managedContext.save()
                dismiss(animated: true) { [weak self] in
                    
                    self?.complition?()
                    
                }
                
            } catch {
                print(error)
            }
        }
    }
}
