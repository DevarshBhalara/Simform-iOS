//
//  TabbarButtonViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 09/05/23.
//

import UIKit

class TabbarButtonViewController: UITabBarController {
    override func viewDidLoad() {
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        let trashItem = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = doneItem
        navigationItem.rightBarButtonItem = trashItem
    }
}
