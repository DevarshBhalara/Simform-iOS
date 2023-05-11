//
//  UIButtonViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UIButtonViewController: UIViewController {

    // MARK:  Outlets
    @IBOutlet private weak var btnTapMe: UIButton!
    @IBOutlet private weak var lblTextChange: UILabel!
    @IBOutlet private weak var btnAdd: UIButton!
    @IBOutlet private weak var btnLoading: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        btnTapMe.layer.cornerRadius = 6
    }
    
    @IBAction func btnTapMeClick(_ sender: UIButton) {
        print("Button clicked \(sender)")
        lblTextChange.text = "Clicked"
        lblTextChange.textColor = UIColor.blue
        print(btnTapMe.buttonType)
        print(btnAdd.buttonType)
        
        btnAdd.configuration = .plain()
        print(btnAdd.buttonType)
        btnAdd.setTitle("Hello", for: .normal)
        
    }
    
    @IBAction func onClickBtnLoading(_ sender: UIButton) {
        if(sender.configuration?.showsActivityIndicator ?? false) {
            sender.configuration?.showsActivityIndicator = false
        } else {
            sender.configuration?.showsActivityIndicator = true
        }
    }
    
    @IBAction func onClickPrimaryAction(_ sender: UIButton) {
        print("Clicked Primary action")
        let check = sender.role.rawValue
        print(check)
    }

}