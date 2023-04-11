//
//  UIStepperViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UIStepperViewController: UIViewController {

    
    @IBOutlet weak var lblNotContinues: UILabel!
    @IBOutlet weak var lblNotAuto: UILabel!
    @IBOutlet weak var lblShowValue: UILabel!
    @IBOutlet weak var stepperFirst: UIStepper!
 
    @IBOutlet weak var stepperNotAuto: UIStepper!
    
    @IBOutlet weak var stepperNotAutoNotContinues: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblShowValue.text = String(stepperFirst.value)
        lblNotAuto.text = String(stepperNotAuto.value)
        
        stepperNotAutoNotContinues.setIncrementImage(UIImage(named: "burger"), for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperFirst(_ sender: UIStepper) {
        lblShowValue.text = String(sender.value)
        print(sender.value)
    }
    

    @IBAction func stepperNotContinues(_ sender: UIStepper) {
        lblNotContinues.text = String(sender.value)
        print(sender.value)
    }
    
    
    @IBAction func stepperNotAuto(_ sender: UIStepper) {
        lblNotAuto.text = String(sender.value)
        print(sender.value)
    }

    
    @IBAction func notAutoNotContinues(_ sender: UIStepper) {
        
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
