//
//  CustomControlViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/07/23.
//

import UIKit

class CustomControlViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var btnRadio1: RadioButton!
    @IBOutlet weak var btnRadio2: RadioButton!
    
    //MARK: - Variables
    let rangeSlider = RangeSlider(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(rangeSlider)
    }
    
    @IBAction func btnRadioOneSelected(_ sender: UIButton) {
        btnRadio2.isChecked = btnRadio1.isChecked
    }
    
    @IBAction func btnRadioTwoSelected(_ sender: UIButton) {
        btnRadio1.isChecked = btnRadio2.isChecked
    }
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20
        let width = view.bounds.width - 2 * margin
        let height: CGFloat = 30
        
        rangeSlider.frame = CGRect(x: 0, y: 0,
                                   width: width, height: height)
        rangeSlider.center = view.center
        
    }
}
