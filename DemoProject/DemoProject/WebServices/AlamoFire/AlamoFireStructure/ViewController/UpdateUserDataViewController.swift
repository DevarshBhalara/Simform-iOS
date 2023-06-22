//
//  UpdateUserDataViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import UIKit

class UpdateUserDataViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var imgAvatar: UIImageView!
    @IBOutlet private weak var tfId: MyTextField!
    @IBOutlet private weak var tfState: MyTextField!
    @IBOutlet private weak var btnUpdateProfile: UIButton!
    @IBOutlet private weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tfNumber: MyTextField!
    @IBOutlet private weak var btnUpdate: UIButton!
    @IBOutlet private weak var tfEmail: MyTextField!
    @IBOutlet private weak var tfName: MyTextField!
    @IBOutlet private weak var card: UIView!
    
    //MARK: - Variable
    private var viewModel: UpdateUserViewModel = UpdateUserViewModel()
    private var imageUrl = ""
    
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
        
        viewModel.uplaodSuccess.bind { [weak self]
            url in
            self?.imageUrl = url
            print("bind \(self?.imageUrl ?? "NA")")
            
        }
        
        viewModel.image.bind { [weak self]
            image in
            self?.imgAvatar.image = image
            self?.imgAvatar.layer.cornerRadius = (self?.imgAvatar.frame.height ?? 0) / 2
            self?.loadingIndicator.stopAnimating()
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
            self.showAlertDialog(message: "Profile Updated")
        }
    }
    
    private func updateUI(data: GetUserResponse) {
        tfId.text = data.id
        tfName.text = data.name
        tfState.text = data.state
        tfEmail.text = data.email
        tfNumber.text = data.mobilenumber
        viewModel.callLoadImageApi(url: data.avatar ?? "")
    }

    @IBAction func btnUpdateProfile(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func updateBtnClick(_ sender: UIButton) {
        sender.configuration?.showsActivityIndicator = true
        if let name = tfName.text, let email = tfEmail.text, let number = tfNumber.text, let state = tfState.text {
            viewModel.callUpdateApi(email: email, number: number, state: state, name: name, avatarUrl: imageUrl)
        }
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: {_ in
            self.btnUpdate.configuration?.showsActivityIndicator = false
        }))
        self.present(alert, animated: true)
    }
}

//MARK: - UIImage picker delegate
extension UpdateUserDataViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
