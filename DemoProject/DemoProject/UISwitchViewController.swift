//
//  UISwitchViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UISwitchViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var switchTest: UISwitch!
    @IBOutlet weak var lblMsg: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if(sender.isOn) {
            lblMsg.text = "switch is on"
        } else {
            lblMsg.text = "switch is off"
        }
    }
}
