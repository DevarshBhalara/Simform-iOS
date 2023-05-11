//
//  TabViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 02/05/23.
//

import UIKit

class TabViewViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewControllers( [HomeViewController(), ProfileViewController(), Tab3ViewController(), ProfileViewController()] , animated: true)
    }


}
