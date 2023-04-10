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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
