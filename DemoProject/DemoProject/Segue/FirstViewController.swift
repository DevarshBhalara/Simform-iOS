//
//  FirstViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 25/04/23.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textFieldData: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as?   SecondViewController2 else {
            return
        }
        secondVC.dataFromFirstVC = textFieldData.text
    }
    
}
