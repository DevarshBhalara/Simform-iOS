//
//  ViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        
        debugPrint("load View called")
        super.loadView()
        creatlabel()
        
        debugPrint("")
    }
    
    func creatlabel(){
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.text = "Hello"
        self.view.addSubview(label)
        label.center = self.view.center
        label.backgroundColor = UIColor.blue
        label.textAlignment = .center
        label.textColor = UIColor.white
        
    }

    override func viewDidLoad() {
        debugPrint("View did Load")
        super.viewDidLoad()
        
        let objPublicClass = File2PublicClass()
        objPublicClass.methodPublic()
        
        let objPrivateVar = Test2()
        print(objPrivateVar.memberVariableA)
        
        let objOpenClass = ClassOpen()
        objOpenClass.displayClassOpen()
        
        let objTest2 = Test2()
        objTest2.nonPrivateMethod()
        objTest2.displayClassOpen()
        
//        objTest2 = ClassOpen() as! Test2
//        objTest2.displayClassOpen()
//        objTest2.privateMethod()  can't access private method
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("View will appear")
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        debugPrint("View will disappear")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        debugPrint("View did disappear")
    }


}

