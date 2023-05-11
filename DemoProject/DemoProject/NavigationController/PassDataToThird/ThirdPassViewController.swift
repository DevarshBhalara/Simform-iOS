//
//  ThirdPassViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 08/05/23.
//

import UIKit

class ThirdPassViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var lblDataFromFirst: UILabel!
    
    //MARK: - Outlet
    var data: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        lblDataFromFirst.text = data
        // Do any additional setup after loading the view.
    }


}
