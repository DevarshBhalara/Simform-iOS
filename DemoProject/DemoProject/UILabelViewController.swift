//
//  UILabelViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UILabelViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var tvLink: UITextView!
    @IBOutlet weak var lblHover: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWelcome.text = "Welcome! This will occupy lines according to number of lines in label"
        lblWelcome.textAlignment = NSTextAlignment.center
        lblWelcome.font = UIFont.systemFont(ofSize: 30)
        lblWelcome.font = UIFont(name: "impact", size: 30)
        lblWelcome.numberOfLines = 1
        lblWelcome.lineBreakMode = NSLineBreakMode.byTruncatingTail
        lblWelcome.showsExpansionTextWhenTruncated = true
        let a = UIToolTipInteraction(defaultToolTip: "this is test")
        lblWelcome.addInteraction(a)
        lblWelcome.textColor = UIColor.green
        lblWelcome.shadowColor = UIColor.blue
        lblWelcome.attributedText = NSAttributedString.init(string: "Hello")
        
        tvLink.dataDetectorTypes = .link
        lblHover.showsExpansionTextWhenTruncated = true
        let aa = UIToolTipInteraction(defaultToolTip: "this is test")
        lblHover.addInteraction(aa)

        // Do any additional setup after loading the view.
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
