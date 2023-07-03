//
//  CustomTextfield.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/07/23.
//

import Foundation
import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            rightViewMode = .always
            let imageView = UIImageView(image: rightImage?.resizedImage(to: CGSizeMake(22, 22))?.withRenderingMode(.alwaysTemplate))
            imageView.contentMode = .right
            rightView = imageView
            rightView?.tintColor = .red
        }
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            leftViewMode = .always
            let imageView = UIImageView(image: leftImage?.resizedImage(to: CGSizeMake(22, 22))?.withRenderingMode(.alwaysTemplate))
            imageView.contentMode = .left
            leftView = imageView
            leftView?.tintColor = .lightGray
        }
    }
    
    let textPadding = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
    
    // for loading textField in storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }
    
    // for loading textfield while creating programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 15, bottom: 0, right: 15))
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: .init(top: 0, left: 15, bottom: 0, right: 0))
    }
    
    private func updateView() {
        layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.green.cgColor
        returnKeyType = .done
        if let placeholder = placeholder {
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "Primary")?.withAlphaComponent(0.5) ?? .yellow])
        }
    }
}
