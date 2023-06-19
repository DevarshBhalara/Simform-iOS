//
//  UpdateUserViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
import UIKit
class UpdateUserViewModel{

    //MARK: - variable
    var error = Dynamic<String>("")
    var getUser = Dynamic<GetUserResponse?>(nil)
    var updateSuccess = Dynamic<Void>(())
    var validationError = Dynamic<String>("")
    
    let uplaodSuccess = Dynamic<String>("")
    let uploadError = Dynamic<String>("")
    let getProgress = Dynamic<Float>(0.0)
    let image = Dynamic<UIImage?>(nil)
    
    
    func validateData(email: String, number: String, state: String, name: String, imageUrl: String) {
        var error = false
        if email.isEmpty {
            self.validationError.value = "Please enter email!"
            error = true
        } else if number.isEmpty {
            self.validationError.value = "please enter NUmber!"
            error = true
        } else if state.isEmpty {
            self.validationError.value = "Please enter State"
            error = true
        } else if name.isEmpty {
            self.validationError.value = "Please enter Name!"
            error = true
        }
        
        if !error {
            self.callUpdateApi(email: email, number: number, state: state, name: name, avatarUrl: imageUrl)
        }
        
    }
    
    func getUserData() {
        APIManagerDemo.shared.call(type: .getUser) { [weak self]
            (result: Result<GetUserResponse, CustomError>) in
            
            switch result {
            case .success(let user):
                print("User \(user)")
                self?.getUser.value = user
                self?.getUser.fire()
            case .failure(let error):
                print(error.body)
                self?.error.value = error.body
            }
        }
    }
    
    func callUpdateApi(email: String, number: String, state: String, name: String, avatarUrl: String) {
        let param = SignUp(name: name, email: email, mobilenumber: number, state: state, avatar: avatarUrl)
        APIManagerDemo.shared.call(type: .updateUser, params: param.requestParameter()) { [weak self]
            (result: Result<GetUserResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("Updated \(response)")
                self?.updateSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
            }
        }
    }
    
    func callLoadImageApi(url: String) {
        APIManagerDemo.shared.callLoadImage(url: url) {
            [weak self] (result: Result<UIImage, CustomError>) in
            
            switch result {
            case .success(let res):
                self?.image.value = res
                self?.image.fire()
            case .failure(let error):
                print("Error image load \(error)")
            }
        }
    }
    
    func callUplaodApi(image: UIImage) {
        
        APIManagerDemo.shared.callUploadApi(type: .uploadImage, image: image) { [weak self]
            (result: Result<ImageUploadResponse, CustomError>) in
            
            switch result {
            case .success(let res):
                print(res.data?.title ?? "N/A")
                print(res.data?.url ?? "N/A")
                if let url = res.data?.url {
                    self?.uplaodSuccess.value = url
                    self?.uplaodSuccess.fire()
                }
                
            case .failure(let error):
                print(error)
                self?.uploadError.fire()
            }
        } progress: {
            progress in
            print("Progress \(progress.fractionCompleted * 100)")
            self.getProgress.value = Float(progress.fractionCompleted)
            self.getProgress.fire()
        }
    }
    
    
}
