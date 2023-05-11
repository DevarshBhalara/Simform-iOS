//
//  UISliderViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UISliderViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var sliderTest: UISlider!
    @IBOutlet private weak var sliderBrightness: UISlider!
    @IBOutlet private weak var lblShowBrightness: UILabel!
    @IBOutlet private weak var lblCustomize: UILabel!
    @IBOutlet private weak var tfNumber: UITextField!
    @IBOutlet private weak var sliderTfValue: UISlider!
    @IBOutlet private weak var sliderCustom: UISlider!
    @IBOutlet private weak var sliderButton: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        lblShowBrightness.text = "Brightness = \(Int(sliderBrightness.value))"
        sliderTfValue.minimumValue = 1
        sliderTfValue.maximumValue = 100
        sliderTfValue.value = 10
        configureSliderCustom()
        configureSliderButton()
    }
    
    private func configureSliderButton() {
        sliderButton.minimumValue = 1
        sliderButton.maximumValue = 10
        sliderButton.value = 2
    }
    
    private func configureSliderCustom() {
        let minImage = UIImage(named: "facebookLogo")
        sliderCustom.setMinimumTrackImage(minImage, for: .normal)
        
        let maxImage = UIImage(named: "googleLogo")
        sliderCustom.setMaximumTrackImage(maxImage, for: .normal)
    }
    

    @IBAction func slider1ValueChanged(_ sender: UISlider) {
        print("Slider 1 value : \(Int(sender.value))")
    }
    
    
    @IBAction func sliderBrightnessValueChanged(_ sender: UISlider) {
        lblShowBrightness.text = "Brightness = \(Int(sender.value))"
        print("Current Brightness is : \(Int(sender.value))")
        if (sender.value == sender.maximumValue) {
            sender.maximumValueImage = UIImage(systemName: "sun.max.fill")
            
            print("Your brightness is full")
        } else {
            sender.maximumValueImage = UIImage(systemName: "sun.min")
        }
    }
    
    @IBAction func sliderCustomize(_ sender: UISlider) {
        lblCustomize.text = "\(Int(sender.value))"
        
    }
    
    @IBAction func onClickBtnClick(_ sender: UIButton) {
        
        sliderTfValue.setValue(Float(tfNumber.text ?? "0.0") ?? 0.0, animated: true)
    }
    

    
    @IBAction func onClickBtnPlus(_ sender: UIButton) {
        sliderButton.value += 1
    }
    
    
    @IBAction func onClickBtnMinus(_ sender: UIButton) {
        sliderButton.value -= 1
    }
    
    
    @IBAction func pointFiveValueChanged(_ sender: UISlider) {
        var roundedValue = roundf(sender.value / 0.2) * 0.2
        sender.value = roundedValue
        print(sender.value)
        
    }
}
