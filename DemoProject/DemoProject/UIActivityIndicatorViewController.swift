//
//  UIActivityIndicatorViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 17/04/23.
//

import UIKit

class UIActivityIndicatorViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var btnActivityIndicatorStart: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startActivityIndicator(_ sender: UIButton) {
        
        print(activityIndicator.isAnimating)
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = .blue
        activityIndicator.startAnimating()
        print(activityIndicator.isAnimating)
    }
    
    
    @IBAction func stopActivityindicator(_ sender: UIButton) {
        activityIndicator.stopAnimating()
        print(activityIndicator.isAnimating)
        activityIndicator.hidesWhenStopped = true
        
    }
    

}
