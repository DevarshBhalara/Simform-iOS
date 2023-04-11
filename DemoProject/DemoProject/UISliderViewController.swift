//
//  UISliderViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UISliderViewController: UIViewController {

    @IBOutlet weak var sliderTest: UISlider!
    @IBOutlet weak var sliderBrightness: UISlider!
    @IBOutlet weak var lblShowBrightness: UILabel!
    @IBOutlet weak var lblCustomize: UILabel!
    @IBOutlet weak var tfNumber: UITextField!
    @IBOutlet weak var sliderTfValue: UISlider!
    @IBOutlet weak var sliderCustom: UISlider!
    @IBOutlet weak var sliderButton: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblShowBrightness.text = "Brightness = \(Int(sliderBrightness.value))"
        // Do any additional setup after loading the view.
        
        sliderTfValue.minimumValue = 1
        sliderTfValue.maximumValue = 100
        sliderTfValue.value = 10
        
        configureSliderCustom()
        configureSliderButton()
    }
    
    func configureSliderButton() {
        sliderButton.minimumValue = 1
        sliderButton.maximumValue = 10
        sliderButton.value = 2
    }
    
    func configureSliderCustom() {
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
    
//    let step = 0.5
//    @IBAction func pointFiveValueChanged(_ sender: UISlider) {
//        let roundedValue = round(Double(sender.value) / step) * step
//        sender.value = Float(roundedValue)
//    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
