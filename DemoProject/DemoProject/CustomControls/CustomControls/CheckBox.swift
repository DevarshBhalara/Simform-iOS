//
//  CheckBox.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/07/23.
//

import Foundation
import UIKit

@IBDesignable
class CheckBox: UIButton {
    
    // Radio button properties
    var isChecked: Bool = false {
        didSet {
            updateButton()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        updateButton()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateButton()
        
    }
    
    @objc func buttonTapped() {
        isChecked = !isChecked
    }
    
    // Update button appearanceprivate
    private func updateButton() {
        let image = isChecked ? UIImage(named: "unchecked") : UIImage(named: "checkboxSelected")
        setImage(image, for: .normal)
    }
    
}
