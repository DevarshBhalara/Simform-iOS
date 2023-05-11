//
//  DiscardThirdViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import UIKit

class DiscardThirdViewController: UIViewController {

    var delegate: DataPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func discardAll(_ sender: UIButton) {
//        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        
        guard let forthVC = storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController else {
            return
        }
        
        let nav = UINavigationController(rootViewController: forthVC)
        forthVC.delegate = delegate
        navigationController?.pushViewController(forthVC, animated: true)
        
         /** Example of push from presented view controller  */
//        nav.modalPresentationStyle = .fullScreen
//        self.present(nav, animated: true)
//        pushViewController(nav, animated: true)
    }
}
