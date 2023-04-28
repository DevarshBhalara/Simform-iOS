//
//  UIProgressBarViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UIProgressBarViewController: UIViewController {

    
    
    @IBOutlet private weak var secondProgressView: UIProgressView!
    @IBOutlet private weak var firstProgressView: UIProgressView!
    @IBOutlet private weak var sliderFirst: UIProgressView!
    @IBOutlet private weak var sliderColorChange: UISlider!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var tfName: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    @IBOutlet private weak var lblMsg: UILabel!
    @IBOutlet private weak var btnSubmit: UIButton!

    
    let progress = Progress(totalUnitCount: 2)
    var ratio: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.isHidden = true
        ratio = 0
        progressView.progress = ratio!
        lblMsg.isHidden = true
        progressView.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10

        firstProgressView.trackTintColor = UIColor.black
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickSubmit(_ sender: UIButton) {
        
        if(tfName.text != "" && tfEmail.text != ""){
               btnSubmit.isHidden = true
               lblMsg.isHidden = false
               progressView.isHidden = false
                   Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                       print(timer)
                       guard self.progress.isFinished == false else{
                           timer.invalidate()
                           self.lblMsg.text = "Data Saved"
                           return
                       }
                       self.progress.completedUnitCount += 1
                       let progrsssFloat = Float(self.progress.fractionCompleted)
                       self.progressView.setProgress(progrsssFloat, animated: true)
                         
                   }
               }
    }
    
    
    @IBAction func sliderColorChangeValue(_ sender: UISlider) {
        self.view.backgroundColor = UIColor.random()
        firstProgressView.progress = sender.value
        
    }
    
    @IBAction func btnCompleteProgress(_ sender: UIButton) {
        
        if (secondProgressView.progress == 1.0) {
            secondProgressView.setProgress(0.0, animated: true)
        }else {
            secondProgressView.setProgress(1.0, animated: true)
        }
    }

}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
