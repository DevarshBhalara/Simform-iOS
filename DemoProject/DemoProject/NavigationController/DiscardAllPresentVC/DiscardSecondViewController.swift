//
//  DiscardSecondViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import UIKit

class DiscardSecondViewController: UIViewController {

    @IBOutlet weak var lblDataFromFourth: UILabel!
    var delegate: DataPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoThird(_ sender: UIButton) {
        if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "DiscardThirdViewController") as? DiscardThirdViewController {
            
            thirdVC.delegate = self
            navigationController?.pushViewController(thirdVC, animated: true)
            /** Example of push from presented view controller  */
//            thirdVC.modalPresentationStyle = .currentContext
//            navigationController?.present(thirdVC, animated: true)
        }
        
    }
    
}

extension DiscardSecondViewController: DataPass {
    func passDataToFirst(data: String) {
        lblDataFromFourth.text = data
    }
    
    
}
