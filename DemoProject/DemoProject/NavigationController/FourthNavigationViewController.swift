//
//  FourthNavigationViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/05/23.
//

import UIKit

class FourthNavigationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func goToFifthVC(_ sender: UIButton) {
        
        if let fifthVC = self.storyboard?.instantiateViewController(withIdentifier: "FifthNavigationViewController") as? FifthNavigationViewController {
//            fifthVC.modalPresentationStyle = .fullScreen
            fifthVC.modalTransitionStyle = .flipHorizontal
            self.present(fifthVC, animated: true)
        }
    }
    
    @IBAction func goToBackProgrammatically(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
