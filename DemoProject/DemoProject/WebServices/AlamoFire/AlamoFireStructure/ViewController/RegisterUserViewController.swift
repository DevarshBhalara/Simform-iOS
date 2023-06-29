//
//  RegisterUserViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import UIKit

class RegisterUserViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: - Outlets
    @IBOutlet private weak var tfState: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    @IBOutlet private weak var tfName: UITextField!
    @IBOutlet private weak var loginCard: UIView!
    @IBOutlet private weak var btnSignUp: UIButton!
    @IBOutlet private weak var imgAvatar: UIImageView!
    @IBOutlet private weak var btnUpload: UIButton!
    @IBOutlet private weak var tfMobileNumber: UITextField!
    
    //MARK: - Variable
    let viewModel: RegisterViewModel = RegisterViewModel()
    var imageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        bindSignUpUi()
        loginCard.layer.cornerRadius = 10
    }
    
    private func bindViewModel() {
        viewModel.validationError.bind { [weak self]
            message in
            self?.showAlertDialog(message: message, type: TypeDialog.error)
        }
        viewModel.uplaodSuccess.bind { [weak self]
            url in
            self?.imageUrl = url
            print("bind \(self?.imageUrl ?? "NA")")
            
        }
    }
    
    private func bindSignUpUi() {
        viewModel.error.bind { [weak self]
            message in
            print("Error \(message)")
            self?.showAlertDialog(message: "Server side Error", type: TypeDialog.error)
        }
        
        viewModel.signUpSuccess.bind { [weak self]
            message in
            print(message)
            self?.showAlertDialog(message: "Welcome to our App \(message)", type: TypeDialog.success)
        }
        
    }
    
    @IBAction func btnSignUpClick(_ sender: UIButton) {
        sender.configuration?.showsActivityIndicator = true
        print("in vc \(imageUrl)")
        if let name = tfName.text, let email = tfEmail.text, let number = tfMobileNumber.text, let state = tfState.text {
            viewModel.validateData(email: email, number: number, state: state, name: name, imageUrl: imageUrl)
        }
        
    }
    
    
    @IBAction func btnUploadImage(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String, type: TypeDialog) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {
            _ in
            if type == TypeDialog.success {
                self.btnSignUp.configuration?.showsActivityIndicator = false
                if let vc = self.storyboard?.instantiateViewController(withIdentifier: "UpdateUserDataViewController") {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }))
        self.present(alert, animated: true)
    }
}

extension RegisterUserViewController {
    enum TypeDialog {
        case error
        case success
    }
}

//MARK: - Picker controller delegate
extension RegisterUserViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] else {
            return
        }
        let imageAvatar = image as? UIImage
        
        if let imageAvatar = imageAvatar {
            viewModel.callUplaodApi(image: imageAvatar)
            self.imgAvatar.image = imageAvatar
            self.imgAvatar.layer.cornerRadius = self.imgAvatar.frame.height / 2
        }
        dismiss(animated: true)
    
    }
}
