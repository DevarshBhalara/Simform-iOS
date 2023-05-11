//
//  FourthViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 05/05/23.
//

import UIKit

class FourthViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToSecond(_ sender: UIButton) {
        for controller in navigationController!.viewControllers {
            if controller is SecondViewViewController {
                navigationController?.popToViewController(controller, animated: true)
            }
        }
    }
    
    @IBAction func disMissAll(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
