//
//  DiscardFirstViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import UIKit

class DiscardFirstViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var lblData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSecond(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "DiscardSecondViewController") as? DiscardSecondViewController else { return }
      
        navigationController?.pushViewController(secondVC, animated: true)
        
    }
}


