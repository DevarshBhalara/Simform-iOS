//
//  SecondViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 25/04/23.
//

import UIKit

class SecondViewController2: UIViewController {

    @IBOutlet weak var lblData: UILabel!
    
    var dataFromFirstVC: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        lblData.text = dataFromFirstVC
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPressed(_ sender: Any) {
        performSegue(withIdentifier: "gotoStoryBoard", sender: self)
    }
    
        
}
