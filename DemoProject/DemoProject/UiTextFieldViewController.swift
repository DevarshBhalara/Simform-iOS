//
//  UiTextFieldViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UiTextFieldViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfCapitalization: UiTextFieldPadding!
    @IBOutlet weak var tfJustText: UiTextFieldPadding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tfCapitalization.padding)
        print(tfJustText.text ?? "no text")
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
    
    
    
    //UiTextField Delegated method
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("shouldn being editing")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Editing begin")
    }
    
    func textField(_ textField: UITextField, willDismissEditMenuWith animator: UIEditMenuInteractionAnimating) {
        print("while entring character this called")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let txtAfterUpdate: NSString = self.tfCapitalization.text! as NSString
        txtAfterUpdate.replacingCharacters(in: range, with: string)
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
    
   
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

