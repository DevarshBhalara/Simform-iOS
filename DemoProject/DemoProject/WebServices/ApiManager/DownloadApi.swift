//
//  DownloadApi.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/06/23.
//

import Foundation
class DownloadApi {
    
    var delegate: URLSessionDownloadDelegate?
    var downloadTask: URLSessionDownloadTask = URLSessionDownloadTask()
    var resumeData: Data = Data()
    var urlSession: URLSession = URLSession()
    
    lazy var urlSessionConfig: URLSessionConfiguration = {
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier ?? "")")
        config.timeoutIntervalForRequest = 30
        return config
    }()
    
    static let shared = DownloadApi()
    
    
    func downloadFile(stringUrl: String) {
        if let url = URL(string: stringUrl) {
            
            urlSession = URLSession(configuration: urlSessionConfig, delegate: delegate, delegateQueue: nil)
            downloadTask = urlSession.downloadTask(with: url)
            downloadTask.resume()
        }
    }
    
    func pauseDownload() {
        downloadTask.cancel(byProducingResumeData: {
            data in
            self.resumeData = data ?? Data()
        })
    }
    
    func resumeDownload() {
        downloadTask = urlSession.downloadTask(withResumeData: resumeData)
        downloadTask.resume()
    }
}

