//
//  UIPickerViewImageViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/04/23.
//

import UIKit

class UIPickerViewImageViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var pickerViewImage: UIPickerView!
    
    //MARK: - Variaable
    let imageArray = [
        UIImage(named: "avtar"),
        UIImage(named: "13reason"),
        UIImage(named: "farzi"),
        UIImage(named: "elite")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        pickerViewImage.delegate = self
    }
}

//MARK: - Picker view delegate
extension UIPickerViewImageViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myImageView.image = imageArray[row]
        view.addSubview(myImageView)
        return view
        
    }
}

//MARK: - Picker view datasource
extension UIPickerViewImageViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        imageArray.count
    }
}
