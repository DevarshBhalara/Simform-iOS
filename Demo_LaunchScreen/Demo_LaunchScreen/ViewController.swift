//
//  ViewController.swift
//  Demo_LaunchScreen
//
//  Created by Devarsh Bhalara on 14/02/23.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var WelcomeLabel: UILabel!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    var i = 0;
    let randomInt = Int.random(in: 0..<4);
    var name = Bundle.main.infoDictionary!["name"] as! String;
    

    
    
    
    
    @IBAction func BtnClick(_ sender: Any) {
        
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        
        //print("Next Page")
    }
    override func viewDidLoad() {
        
        NameLabel.text = "\(name)"
        print(randomInt)
        
        if randomInt == 1 || randomInt == 2{
            WelcomeLabel.text = "It's Good to see you "
        }else if   randomInt == 3 || randomInt == 4{
            WelcomeLabel.text = "Great to see you again"
        }else if randomInt == 0 {
            WelcomeLabel.text = "Welcome for the first time"
        }
               
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

