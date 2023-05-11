//
//  SecondPassViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import UIKit

class SecondPassViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var btnGoToThird: UIButton!
    
    //MARK: - Variable
    var dataFromFirst: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGoToThirdClick(_ sender: UIButton) {
        guard let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdPassViewController") as? ThirdPassViewController else
        {
            return
        }
        thirdVC.data = dataFromFirst
        navigationController?.pushViewController(thirdVC, animated: true)
    }
}
