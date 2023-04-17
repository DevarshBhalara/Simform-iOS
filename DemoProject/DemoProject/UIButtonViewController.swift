//
//  UIButtonViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UIButtonViewController: UIViewController {

    // MARK:  Outlets
    @IBOutlet weak var btnTapMe: UIButton!
    @IBOutlet weak var lblTextChange: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnLoading: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnTapMe.layer.cornerRadius = 6

        // Do any additional setup after loading the view.
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
