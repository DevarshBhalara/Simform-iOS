//
//  DownloadImageViewModel.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/06/23.
//

import Foundation
class DownloadImageViewModel {
    
    let downloadSuccess = Dynamic<String>("")
    let error = Dynamic<String>("")
    let progress = Dynamic<Float>(0.0)
    
    func callDownloadApi(url: String, destinationPath: String) {
        APIManagerDemo.shared.downloadAndSaveImage(url: url, destinationPath: destinationPath) { [weak self]
            url, error  in
            
            if let url = url {
                print("URL \(url)")
                self?.downloadSuccess.value = url.absoluteString
                self?.downloadSuccess.fire()
            }
            if let error = error {
                print("Error \(error)")
                self?.error.value = "Some error occurred"
                self?.error.fire()
            }
        } progress: {
            progressCount in
            self.progress.value = Float(progressCount.fractionCompleted)
            self.progress.fire()
        }
    }
}
