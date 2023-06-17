//
//  UplaodImageViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/06/23.
//

import Foundation
import UIKit
class UploadImageViewModel {
    let uplaodSuccess = Dynamic<Void>(())
    let uploadError = Dynamic<String>("")
    let getProgress = Dynamic<Float>(0.0)
    
    
    func callUplaodApi(image: UIImage) {
        
        APIManagerDemo.shared.callUploadApi(type: .uploadImage, image: image) { [weak self]
            (result: Result<ImageUploadResponse, CustomError>) in
            
            switch result {
            case .success(let res):
                print(res.data?.title)
                self?.uplaodSuccess.fire()
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
