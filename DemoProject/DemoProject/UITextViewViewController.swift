//
//  UITextViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UITextViewViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tvFirst: UITextView!
    @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var lblPrint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        tvFirst.layer.borderWidth = 1
        tvFirst.layer.borderColor = UIColor.gray.cgColor
        tvFirst.addDoneButtonOnKeyboard()
    }
    
    @IBAction func clickBtnClick(_ sender: Any) {
        lblPrint.numberOfLines = 0
        lblPrint.text = tvFirst.text
    }

}

//MARK: - textField delegate
extension UITextViewViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("Changes ")
        return true
    }
}
