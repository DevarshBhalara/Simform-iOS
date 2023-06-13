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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSelectImage(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    @IBAction func uploadImage(_ sender: UIButton) {
        
        if(self.imageView.image != nil) {
            ///Upload image from viewController
//            uplaodImage(image: self.imageView)
//            uploadImaggeUsingBinary(image: self.imageView)
            
            ///Call method form view Model
//            viewModel.uplaodImage(image: self.imageView)
            viewModel.uploadImaggeUsingBinary(image: self.imageView)
        }
        
    }
    
    ///upload image using Binary data
//    private func uploadImaggeUsingBinary(image: UIImageView) {
//
//        if var url = URL(string: "https://api.imgbb.com/1/upload") {
//            url.append(queryItems: [URLQueryItem(name: "key", value: "f8fe9a449ea4b2a9b7387b9e0d3d59c7")])
//
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "POST"
//            let body = urlRequest.setMultipartFormDataBinaryImage(params: ["image" : (image.image!.pngData()!, "myimagae.jpeg")])
//
//            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
//                if let data = data {
//                    do {
//
//                        let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
//                    } catch let error {
//                        print("error \(error)")
//                    }
//                }
//            }
//            uploadTask.delegate = self
//            uploadTask.resume()
//        }
//    }
    
    ///upload image using base64 string
//    private func uplaodImage(image: UIImageView) {
//
//        if var url = URL(string: "https://api.imgbb.com/1/upload") {
//            url.append(queryItems: [URLQueryItem(name: "key", value: "f8fe9a449ea4b2a9b7387b9e0d3d59c7")])
//
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "POST"
//            let body = urlRequest.setMultipartFormData(params: ["image" : (image.image!.pngData()!.base64EncodedString(), nil)])
//
//            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
//                if let data = data {
//                    do {
//
//                        let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
//                    } catch let error {
//                        print("error \(error)")
//                    }
//                }
//            }
//            uploadTask.delegate = self
//            uploadTask.resume()
//        }
//    }
}


extension UploadImageViewController: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        print("\(totalBytesSent) \(totalBytesExpectedToSend)")
        
        DispatchQueue.main.async {
            self.progressBar.progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
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
        
    }
    
}


