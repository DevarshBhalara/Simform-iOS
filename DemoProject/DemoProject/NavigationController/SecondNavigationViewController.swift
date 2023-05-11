//
//  SecondNavigationViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/05/23.
//

import UIKit

protocol GoToFirstVCDelegate: AnyObject {
    func passDetails(data: String)
}

class SecondNavigationViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tfData: UITextField!
    @IBOutlet weak var lblWelcome: UILabel!
    
    //MARK: - Variables
    var details: String = "Welcome"
    weak var delegate: GoToFirstVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        tfData.delegate = self
        lblWelcome.text = details
    }

    @IBAction func passTOFirstVC(_ sender: UIButton) {
        delegate?.passDetails(data: tfData.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }

    //method to jump directly into this view controller
    @IBAction func gotoSecondVC(segue: UIStoryboardSegue) {
        
    }
}

//MARK: - textfield delegate
extension SecondNavigationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
         return true
    }
}
