//
//  FirstPassViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import UIKit

class FirstPassViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tfData: UITextField!
    @IBOutlet weak var btnThird: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func gotoThirdBtnClick(_ sender: UIButton) {
        guard let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdPassViewController") as? ThirdPassViewController else
        {
            return
        }
        thirdVC.data = tfData.text ?? ""
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
}
