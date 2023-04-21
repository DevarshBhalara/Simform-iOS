//
//  TabViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/04/23.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.tabBar.items?[1].badgeValue = "3"
    }
    
}

extension TabViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        true
    }

    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        item.badgeValue = nil
    }
    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        viewController.tabBarItem.badgeValue = nil
//        print(viewController.tabBarItem.badgeValue ?? "")
//    }
    
    override func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        print("will")
        print(items.count)
    }
 
    
}
