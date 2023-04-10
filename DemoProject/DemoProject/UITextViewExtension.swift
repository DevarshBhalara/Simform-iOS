//
//  UITextViewExtension.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

extension UITextView {

    func addDoneButtonOnKeyboard()
       {
           let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
           doneToolbar.barStyle = .default
           let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
           let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(resignFirstResponder))
           let items = [flexSpace, done]
           doneToolbar.items = items
           doneToolbar.sizeToFit()

           self.inputAccessoryView = doneToolbar
       }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
