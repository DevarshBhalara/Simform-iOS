//
//  DownloadImageViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/06/23.
//

import UIKit

class DownloadImageViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var progressDownload: UIProgressView!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var lblDownload: UILabel!
    @IBOutlet weak var tfDownloadUrl: UITextField!
    @IBOutlet weak var lblLocation: UILabel!
    
    //MARK: Variable
    let viewModel = DownloadImageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUi()
    }
    
    private func setUpUi() {
        viewModel.error.bind { [weak self]
            message in
            self?.showAlertDialog(message: message)
            
        }
        
        viewModel.downloadSuccess.bind { [weak self]
            message in
            self?.showAlertDialog(message: "Image Download Successfully at \(message)")
            self?.lblLocation.text = message
        }
        
        viewModel.progress.bind { [weak self]
            progress in
            self?.progressDownload.progress = progress
            self?.lblDownload.text =  String((Int(Float(progress) * 100))) + "%"
            print("Progress in vc \(progress)")
        }
    }

    @IBAction func btnDownloadClick(_ sender: Any) {
        
        if let urlString = tfDownloadUrl.text {
            let docsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let destinationPath = docsPath.appendingPathComponent(URL(string: urlString)!.lastPathComponent)
            
            viewModel.callDownloadApi(url: urlString, destinationPath: destinationPath.path)
        }
        
    }
    
    ///Show alert Dialog method
    private func showAlertDialog(message: String) {
        let alert = UIAlertController(title: "Demo App", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
}
