//
//  UILabelViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UILabelViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var tvLink: UITextView!
    @IBOutlet weak var lblHover: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        lblWelcome.text = "Welcome! This will occupy lines according to number of lines in label"
        lblWelcome.textAlignment = NSTextAlignment.center
        lblWelcome.font = UIFont.systemFont(ofSize: 30)
        lblWelcome.font = UIFont(name: "impact", size: 30)
        lblWelcome.numberOfLines = 1
        lblWelcome.lineBreakMode = NSLineBreakMode.byTruncatingTail
        lblWelcome.showsExpansionTextWhenTruncated = true
        lblWelcome.textColor = UIColor.green
        lblWelcome.shadowColor = UIColor.blue
        lblWelcome.attributedText = NSAttributedString.init(string: "Hello")
        tvLink.dataDetectorTypes = .link
        lblHover.showsExpansionTextWhenTruncated = true
    }

}
