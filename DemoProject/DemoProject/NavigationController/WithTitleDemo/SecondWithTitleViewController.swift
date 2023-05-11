//
//  SecondWithTitleViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/05/23.
//

import UIKit

class SecondWithTitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.backgroundColor = .systemGray2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusIconClicked(_ sender: UIButton) {
        //checking whether button is clicked or not
            print("Plus icon clicked")
    }
}
