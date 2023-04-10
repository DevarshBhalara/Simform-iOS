//
//  ViewController.swift
//  Access_Modifier
//
//  Created by Devarsh Bhalara on 03/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let obj = PublicClass()
        debugPrint(obj.a)
        
        let obj3 = PublicClass2()
        obj3.printPublic()
//        let obj2 = PrivateClass()
        
        //debugPrint(obj.aa) can't access private variable
        // Do any additional setup after loading the view.
    }
}
