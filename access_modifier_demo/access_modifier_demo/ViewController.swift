//
//  ViewController.swift
//  access_modifier_demo
//
//  Created by Devarsh Bhalara on 10/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var objPublicClass = File2PublicClass()
        objPublicClass.methodPublic()
        
        var objPrivateVar = Test2()
        print(objPrivateVar.a)
        
        var objOpenClass = ClassOpen()
        objOpenClass.display()
        // Do any additional setup after loading the view.
        
    }
}

