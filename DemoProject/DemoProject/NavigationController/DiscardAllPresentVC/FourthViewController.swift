//
//  FifthViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 09/05/23.
//

import UIKit
protocol DataPass: AnyObject {
    func passDataToFirst(data: String)
}

class FourthViewController: UIViewController {

    //MARK: - Variables
    weak var delegate: DataPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func passToFirst(_ sender: UIButton) {
        
        delegate?.passDataToFirst(data: "From Fourth")
        for controllers in navigationController!.viewControllers as Array {
            if controllers is DiscardSecondViewController {
                navigationController?.popToViewController(controllers, animated: true)
            }
        }
    }
    
    @IBAction func goToNextVC(_ sender: UIButton) {
        guard let fifthVC = storyboard?.instantiateViewController(withIdentifier: "FifthViewController") else { return }
        navigationController?.pushViewController(fifthVC, animated: true)
    }
}
