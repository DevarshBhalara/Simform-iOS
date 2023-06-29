//
//  RegisterViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 16/06/23.
//

import Foundation
import UIKit
class RegisterViewModel {
    
    //MARK: - Variables
    let error = Dynamic<String>("")
    let signUpSuccess = Dynamic<String>("")
    let validationError = Dynamic<String>("")
    
    let uplaodSuccess = Dynamic<String>("")
    let uploadError = Dynamic<String>("")
    let getProgress = Dynamic<Float>(0.0)
    
    
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
        } else if imageUrl.isEmpty {
            self.validationError.value = "Image Not uploaded try again!"
        }
        
        if !error {
            self.callSignUpApi(email: email, number: number, state: state, name: name, imageUrl: imageUrl)
        }
        
            
    }
    
    func getUser(id: String) {
        APIManagerDemo.shared.call(type: .signUp) { [weak self]
            (result: Result<SignUpResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("Sign up response \(response)")
                self?.signUpSuccess.value = response.id
                self?.signUpSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
            }
        }
    }
    
    func callSignUpApi(email: String, number: String, state: String, name: String, imageUrl: String) {
        let param = SignUp(name: name, email: email, mobilenumber: number, state: state, avatar: imageUrl)
        APIManagerDemo.shared.call(type: .signUp, params: param.requestParameter()) { [weak self]
            (result: Result<SignUpResponse, CustomError>) in
            
            switch result {
            case .success(let response):
                print("Sign up response \(response)")
                UserDefaults.standard.set(response.id, forKey: "userid")
                self?.signUpSuccess.value = response.id
                self?.signUpSuccess.fire()
            case .failure(let error):
                self?.error.value = error.body
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
        } progress: { [weak self]
            progress in
            print("Progress \(progress.fractionCompleted * 100)")
            self?.getProgress.value = Float(progress.fractionCompleted)
            self?.getProgress.fire()
        }
    }
    
}
