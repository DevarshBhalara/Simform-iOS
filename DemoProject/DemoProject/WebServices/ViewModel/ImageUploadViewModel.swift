//
//  ImageUploadViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 13/06/23.
//

import Foundation
import UIKit
class ImageUploadViewModel: NSObject {
    
    override init() {
        super.init()
    }
    
    func uplaodImage(image: UIImageView) {
        
        if var url = URL(string: "https://api.imgbb.com/1/upload") {
            url.append(queryItems: [URLQueryItem(name: "key", value: "f8fe9a449ea4b2a9b7387b9e0d3d59c7")])
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            let body = urlRequest.setMultipartFormData(params: ["image" : (image.image!.pngData()!.base64EncodedString(), nil)])
            
            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
                        print(response)
                    } catch let error {
                        print("error \(error)")
                    }
                }
            }
            uploadTask.resume()
        }
    }
    
    func uploadImaggeUsingBinary(image: UIImageView) {

        if var url = URL(string: "https://api.imgbb.com/1/upload") {
            url.append(queryItems: [URLQueryItem(name: "key", value: "f8fe9a449ea4b2a9b7387b9e0d3d59c7")])

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            let body = urlRequest.setMultipartFormDataBinaryImage(params: ["image" : (image.image!.pngData()!, "myimagae.jpeg")])

            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
                if let data = data {
                    do {

                        let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
                        print(response)
                    } catch let error {
                        print("error \(error)")
                    }
                }
            }
            uploadTask.resume()
        }
    }
}
