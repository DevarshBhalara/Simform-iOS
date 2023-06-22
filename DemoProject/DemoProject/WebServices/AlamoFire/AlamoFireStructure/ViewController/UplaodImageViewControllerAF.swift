//
//  UplaodImageViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/06/23.
//

import UIKit
import Alamofire
class UplaodImageViewControllerAF: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var imgUplaod: UIImageView!
    @IBOutlet private weak var btnUplaodImage: UIButton!
    @IBOutlet private weak var lblProgress: UILabel!
    @IBOutlet private weak var progress: UIProgressView!
    @IBOutlet private weak var btnSelectImage: UIButton!
    
    //MARK: Variable
    private let viewModel = UploadImageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.uplaodSuccess.bind { [weak self] in
            print("upload Success")
            self?.showAlertDialog(message: "Image Uplaoded Successfully")
        }
        
        viewModel.uploadError.bind { [weak self] _ in
            print("Some error occurred")
            self?.showAlertDialog(message: "Some error occurred")
        }
        
        viewModel.getProgress.bind { [weak self]
            progress in
            self?.progress.progress = progress
            self?.lblProgress.text =  String((Int(Float(progress) * 100))) + "%"
            print("Progress in vc \(progress)")
        }
    }
    
    @IBAction func btnSelectImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func btnUplaodImage(_ sender: Any) {
        if let img = imgUplaod.image {
            viewModel.callUplaodApi(image: img)
        }
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

//MARK: - Extension image picker
extension UplaodImageViewControllerAF: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] else {
            return
        }
        imgUplaod.image = image as? UIImage
        dismiss(animated: true)
        
    }
}


