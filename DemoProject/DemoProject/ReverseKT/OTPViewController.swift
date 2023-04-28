//
//  OTPViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 02/05/23.
//

import UIKit

class OTPViewController: UIViewController {

    @IBOutlet weak var tfNumberFour: UITextField!
    @IBOutlet weak var tfNumberThree: UITextField!
    @IBOutlet weak var tfNumberTwo: UITextField!
    @IBOutlet weak var tfNumberOne: UITextField!
    
    @IBOutlet weak var tfNumberFive: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    private func setUpUI() {
        tfNumberOne.delegate = self
        tfNumberTwo.delegate = self
        tfNumberThree.delegate = self
        tfNumberFour.delegate = self
        tfNumberFive.delegate = self
    }
}

extension OTPViewController: UITextFieldDelegate {
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == tfNumberOne {
    
            if (textField.text?.count ?? 0) < 1 {
                textField.text = string
                tfNumberTwo.becomeFirstResponder()
                return true
            } else {
                tfNumberTwo.becomeFirstResponder()
                return false
            }
        }
        return true
        
        
    }
    
    
    
}
