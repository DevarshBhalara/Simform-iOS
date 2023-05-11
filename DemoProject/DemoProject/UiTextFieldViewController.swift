//
//  UiTextFieldViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UiTextFieldViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tfName: UITextField!
    @IBOutlet private weak var tfCapitalization: UiTextFieldPadding!
    @IBOutlet private weak var tfJustText: UiTextFieldPadding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        print(tfCapitalization.padding)
        print(tfJustText.text ?? "no text")
        tfJustText.delegate = self
        tfCapitalization.delegate = self
        tfJustText.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue { self.view.frame.origin.y = 0 }
    }
    
    
}
//MARK: - Textfield delegate
extension UiTextFieldViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("shouldn being editing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Editing begin")
    }
    
    func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating) {
        print("wiilDismissEditMenuWith")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfJustText {
            let txtAfterUpdate =
            (self.tfJustText.text! as NSString).replacingCharacters(in: range, with: string) 
            return true
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == tfJustText {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Editing end")
    }
    
  
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("should clear")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("should end editing")
        return true
    }

}

