//
//  ViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        
//        debugPrint("load View called")
        super.loadView()
//        creatlabel()
        
//        debugPrint("")
    }
    
//    func creatlabel(){
//        let label = UILabel()
//        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//        label.text = "Hello"
//        self.view.addSubview(label)
//        label.center = self.view.center
//        label.backgroundColor = UIColor.blue
//        label.textAlignment = .center
//        label.textColor = UIColor.white
//
//    }

    override func viewDidLoad() {
        debugPrint("View did Load")
        super.viewDidLoad()
        
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

