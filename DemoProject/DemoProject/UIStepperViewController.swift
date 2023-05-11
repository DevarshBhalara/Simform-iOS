//
//  UIStepperViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UIStepperViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var lblNotContinues: UILabel!
    @IBOutlet private weak var lblNotAuto: UILabel!
    @IBOutlet private weak var lblShowValue: UILabel!
    @IBOutlet private weak var stepperFirst: UIStepper!
    @IBOutlet private weak var stepperNotAuto: UIStepper!
    @IBOutlet private weak var stepperNotAutoNotContinues: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        lblShowValue.text = String(stepperFirst.value)
        lblNotAuto.text = String(stepperNotAuto.value)
        stepperNotAutoNotContinues.setIncrementImage(UIImage(systemName: "sun.min"), for: .normal)
        stepperNotAutoNotContinues.setDecrementImage(UIImage(systemName: "sun.max"), for: .normal)
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
        print(sender.value)
    }

}
