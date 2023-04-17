//
//  UiImagePickerViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit

class UiImagePickerViewController: UIViewController {
    
    let imagePicker = UIImagePickerController()
    let imagePickerCamera = UIImagePickerController()
    let imagePickerSavedAlbum = UIImagePickerController()

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func picButton(_ sender: UIButton) {
       
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func pickImageUsingCamera(_ sender: Any) {
        
        imagePickerCamera.sourceType = .camera
        imagePickerCamera.delegate = self
        self.present(imagePickerCamera, animated: true)
    }
    
    @IBAction func pickFromSavedAlbum(_ sender: Any) {
        
        imagePickerSavedAlbum.sourceType = .savedPhotosAlbum
        imagePickerSavedAlbum.delegate = self
        self.present(imagePickerSavedAlbum, animated: true)
    }
}

extension UiImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancled by user")
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if picker == imagePicker {
            print("did finish picke")
            guard let image = info[.editedImage] else {
                return
            }
            
            imageView.image = image as? UIImage
            print(info[.cropRect] ?? CGRect())
            print(info[.imageURL] ?? "")
            print(info[.mediaMetadata] ?? "")
            print(info[.mediaType] ?? "")
            print(info[.mediaURL] ?? "")
            dismiss(animated: true)
        } else if picker == imagePickerCamera {
            
            print("did finish picker camera")
            guard let image = info[.originalImage] else {
                return
            }
            
            imageView.image = image as? UIImage
            dismiss(animated: true)
        } else if picker == imagePickerSavedAlbum {
            
            print("did finish picker saved album" )
            guard let image = info[.originalImage] else {
                return
            }
            
            imageView.image = image as? UIImage
            dismiss(animated: true)
        }
         
       
    }
    
}
