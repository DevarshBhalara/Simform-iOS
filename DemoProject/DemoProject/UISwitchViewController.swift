//
//  UISwitchViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UISwitchViewController: UIViewController {

    @IBOutlet weak var switchTest: UISwitch!
    
    @IBOutlet weak var lblMsg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if(sender.isOn) {
            lblMsg.text = "switch is on"
        } else {
            lblMsg.text = "switch is off"
        }
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
