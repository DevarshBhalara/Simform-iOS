//
//  DownloadFileViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 14/06/23.
//

import UIKit

class DownloadFileViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var btnDowload: UIButton!
    @IBOutlet weak var pbDownload: UIProgressView!
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var btnPauseResume: UIButton!
    @IBOutlet weak var lblLocation: UILabel!
    
    //MARK: - Variables
    var pdf: URL?
    var downloadTask: URLSessionDownloadTask = URLSessionDownloadTask()
    var resumeData: Data = Data()
    var urlSession: URLSession = URLSession()
    
    private lazy var urlSessionConfig: URLSessionConfiguration = {
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier ?? "")")
        config.timeoutIntervalForRequest = 30
        return config
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        lblLocation.text = UserDefaults.standard.url(forKey: "lastFile")?.absoluteString
    }
    
    @IBAction func btnDownloadClck(_ sender: UIButton) {
        DownloadApi.shared.delegate = self
        DownloadApi.shared.downloadFile(stringUrl: tfUrl.text ?? "")

    }
    
    @IBAction func btnPauseResume(_ sender: UIButton) {
        
        if sender.isSelected {
            DownloadApi.shared.pauseDownload()
           
        } else {
            DownloadApi.shared.resumeDownload()
        }
        
        
    }
}

extension DownloadFileViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print(downloadTask.originalRequest?.url as Any)
        guard let url = downloadTask.originalRequest?.url else {
            return
        }
        
        let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationPath = docsPath.appendingPathComponent(url.lastPathComponent)
        
        UserDefaults.standard.set(destinationPath, forKey: "lastFile")
        
        do {
            print(destinationPath)
            try? FileManager.default.removeItem(at: destinationPath)
            try FileManager.default.copyItem(at: location, to: destinationPath)
            self.pdf = destinationPath
        } catch let error {
            print("Error \(error)")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        print("\(totalBytesWritten) \(totalBytesExpectedToWrite)")
        DispatchQueue.main.sync {
            self.pbDownload.progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        }
    }
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        
        DispatchQueue.main.async {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
               let completionHandler = appDelegate.backgroundSessionCompletionHandler {
                appDelegate.backgroundSessionCompletionHandler = nil
                completionHandler()
            }
        }
    }
}
