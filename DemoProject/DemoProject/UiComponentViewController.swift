//
//  UiComponentViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 10/04/23.
//

import UIKit

class UiComponentViewController: UIViewController {

    @IBOutlet weak var btnLabel: UIButton!
    
    @IBOutlet weak var btnButton: UIButton!
    
    @IBOutlet weak var btnTextField: UIButton!
    
    @IBOutlet weak var btnTextView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickUILabel(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
