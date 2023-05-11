//
//  FirstNavigationViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/05/23.
//

import UIKit

class FirstNavigationViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblFromSecond: UILabel!
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //method to jump directly into this view controller
    @IBAction func gotoRootVC(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToSecond" {
            if let destinationVC = segue.destination as? SecondNavigationViewController {
                destinationVC.delegate = self
                destinationVC.details = "Welcome \(tfEmail.text ?? "")"
            }
        }
    }
}

//MARK: - data from second view controller delegate
extension FirstNavigationViewController: GoToFirstVCDelegate {
    
    func passDetails(data: String) {
        lblFromSecond.text = data
    }
}
