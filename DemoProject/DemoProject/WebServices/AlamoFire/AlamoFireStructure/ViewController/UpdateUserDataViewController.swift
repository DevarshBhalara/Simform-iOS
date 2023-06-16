//
//  UpdateUserDataViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import UIKit

class UpdateUserDataViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfId: MyTextField!
    @IBOutlet weak var tfState: MyTextField!
    @IBOutlet weak var tfNumber: MyTextField!
    @IBOutlet weak var tfEmail: MyTextField!
    @IBOutlet weak var tfName: MyTextField!
    @IBOutlet weak var card: UIView!
    
    //MARK: - Variable
    var viewModel: UpdateUserViewModel = UpdateUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        card.layer.cornerRadius = 10
        bindViewModel()
        bindUpdateUI()
        viewModel.getUserData()
    }
    
    private func bindViewModel() {
        viewModel.validationError.bind {
            message in
            print("Message \(message)")
        }
    }
    
    private func bindUpdateUI() {
        viewModel.getUser.bind {
            userData in
            if let userData = userData {
                DispatchQueue.main.async {
                    self.updateUI(data: userData)
                }
            }
        }
        
        viewModel.updateSuccess.bind {
            print("Updated")
        }
    }
    
    private func updateUI(data: GetUserResponse) {
        tfId.text = data.id
        tfId.allowsEditingTextAttributes = false
        tfName.text = data.name
        tfState.text = data.state
        tfEmail.text = data.email
        tfNumber.text = data.mobilenumber
    }

    @IBAction func updateBtnClick(_ sender: Any) {
        if let name = tfName.text, let email = tfEmail.text, let number = tfNumber.text, let state = tfState.text {
            viewModel.callUpdateApi(email: email, number: number, state: state, name: name)
        }
    }
}
