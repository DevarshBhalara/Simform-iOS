//
//  CustomButton.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/07/23.
//

import Foundation
import UIKit
@IBDesignable
class CustomButton: UIButton {

    @IBInspectable
    var isPrimary: Bool = false {
        didSet {
            isPrimary ? filledButton() : outlinedButton()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        updateView()
    }
    
    private func updateView() {
        layer.masksToBounds = true
        layer.cornerRadius = 15
        isPrimary ? filledButton() : outlinedButton()
        addTarget(self, action: #selector(togglePrimary), for: .touchUpInside)
    }

    private func filledButton() {
        layer.borderWidth = 0
        backgroundColor = tintColor
        setTitleColor(.white, for: .normal)
        setTitle("Primary", for: .normal)
    }

    private func outlinedButton() {
        layer.borderWidth = 1
        layer.borderColor = tintColor.cgColor
        backgroundColor = .clear
        setTitleColor(tintColor, for: .normal)
        setTitle("Secondary", for: .normal)
    }

    @objc
    private func togglePrimary() {
        isPrimary.toggle()
    }
}
