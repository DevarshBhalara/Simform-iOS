//
//  UploadImageViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/06/23.
//

import UIKit

class UploadImageViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: - Variables
    private var imagePicker = UIImagePickerController()
    private var viewModel = ImageUploadViewModel()
    
    //MARK: - Outlets
    @IBOutlet private weak var progressBar: UIProgressView!
    @IBOutlet private weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSelectImage(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    ///Show alert Dialog method
    private func showAlertDialog() {
        let alert = UIAlertController(title: "Image Upload", message: "Image uploaded successfully!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}


//MARK: - URLSessionTask Delegate
extension UploadImageViewController: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        print("\(totalBytesSent) \(totalBytesExpectedToSend)")
        
        DispatchQueue.main.async { [weak self] in
            self?.progressBar.progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
            if Float(totalBytesSent) == Float(totalBytesExpectedToSend) {
                self?.showAlertDialog()
            }
        }
    }
}

//MARK: - ImagePicker Delegate
extension UploadImageViewController: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] else {
            return
        }
        imageView.image = image as? UIImage
        dismiss(animated: true)
        ImageUploadViewModel.shared.delegate = self
        ImageUploadViewModel.shared.uploadImaggeUsingBinary(image: imageView)
        
    }
    
}


