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
        tfNumberOne.becomeFirstResponder()
        
//        self.tfNumberOne.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
//        self.tfNumberTwo.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
//        self.tfNumberThree.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
//        self.tfNumberFour.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
//        self.tfNumberFive.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
    }
    
//    @objc func changeCharacter(textField : UITextField){
//            if textField.text?.utf8.count == 1 {
//                switch textField {
//                case tfNumberOne:
//                    tfNumberTwo.becomeFirstResponder()
//                case tfNumberTwo:
//                    tfNumberThree.becomeFirstResponder()
//                case tfNumberThree:
//                    tfNumberFour.becomeFirstResponder()
//                case tfNumberFour:
//                    tfNumberFive.becomeFirstResponder()
//                case tfNumberFive:
//                    tfNumberFive.resignFirstResponder()
//                default:
//                    break
//                }
//            }else if textField.text!.isEmpty {
//                switch textField {
//                case tfNumberFive:
//                    tfNumberFour.becomeFirstResponder()
//                case tfNumberFour:
//                    tfNumberThree.becomeFirstResponder()
//                case tfNumberThree:
//                    tfNumberTwo.becomeFirstResponder()
//                case tfNumberTwo:
//                    tfNumberOne.becomeFirstResponder()
//                default:
//                    break
//                }
//            }
//        }
}

extension OTPViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length == 0 {
            switch textField {
            case tfNumberOne:
                tfNumberTwo.becomeFirstResponder()
            case tfNumberTwo:
                tfNumberThree.becomeFirstResponder()
            case tfNumberThree:
                tfNumberFour.becomeFirstResponder()
            case tfNumberFour:
                tfNumberFive.becomeFirstResponder()
            case tfNumberFive:
                tfNumberFive.resignFirstResponder()
            default:
                break
            }
            textField.text = string
            return false
        } else if range.length == 1 {
            switch textField {
            case tfNumberFive:
                tfNumberFour.becomeFirstResponder()
            case tfNumberFour:
                tfNumberThree.becomeFirstResponder()
            case tfNumberThree:
                tfNumberTwo.becomeFirstResponder()
            case tfNumberTwo:
                tfNumberOne.becomeFirstResponder()
            default:
                break
            }
            textField.text = ""
            return false
        }
        return true
        

    }

    
    
}
