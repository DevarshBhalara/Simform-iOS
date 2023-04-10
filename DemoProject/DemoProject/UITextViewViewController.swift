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
        tvFirst.layer.borderWidth = 1
        tvFirst.layer.borderColor = UIColor.gray.cgColor
        tvFirst.addDoneButtonOnKeyboard()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func clickBtnClick(_ sender: Any) {
        lblPrint.numberOfLines = 0
        lblPrint.text = tvFirst.text
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

extension UITextViewViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print("Changes ")
        return true
    }
}
