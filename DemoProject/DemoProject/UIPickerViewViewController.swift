//
//  UIPickerViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/04/23.
//

import UIKit

class UIPickerViewViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet private weak var tfCountry: UITextField!
    @IBOutlet weak var textFieldToolbar: UITextField!
    @IBOutlet weak var tfDateTime: UITextField!
    
    //MARK: - Variables
    private let countryPicker = UIPickerView()
    private let timePicker = UIPickerView()
    let timeArray = [
        ["1", "2", "3"],
        ["1", "2", "3", "4", "5"],
        ["AM", "PM"]
    ]
    let imageArray = [
        UIImage(named: "avtar"),
        UIImage(named: "13reason"),
        UIImage(named: "farzi"),
        UIImage(named: "elite")
    ]
    var data = ["1", "2", "3", " 4", "5", "6", "7"]
    var hours = 0
    var minutes = 0
    let ampm = ["AM", "PM"]
    var country_list = ["Afghanistan","Albania","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        countryPicker.delegate = self
        countryPicker.dataSource = self
        timePicker.delegate = self
        timePicker.dataSource = self
        tfCountry.delegate = self
        tfDateTime.delegate = self
        tfCountry.inputView = countryPicker
        tfDateTime.inputView = timePicker
        let toolbarTextField = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButtonTextField = UIBarButtonItem(title: "Done", style: .done, target: .none, action: #selector(doneClickedTextField))
        toolbarTextField.setItems([spacer, doneButtonTextField], animated: true)
        textFieldToolbar.inputAccessoryView = toolbarTextField
    }
    
    @objc func doneClickedTextField() {
        print("done button clicked")
        textFieldToolbar.resignFirstResponder()
    }
    
    func setUpToolBar () {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: .none, action: #selector(doneClicked))
        let cancleButton = UIBarButtonItem(title: "Cancle", style: .plain, target: .none, action: #selector(cancleClicked))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([doneButton, spacer, cancleButton], animated: true)
        tfCountry.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked() {
        print("done cliekd")
        tfCountry.resignFirstResponder()
    }
    
    @objc func cancleClicked() {
        tfCountry.text = ""
        tfCountry.resignFirstResponder()
    }

}


//MARK: - Picker view datasource
extension UIPickerViewViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == timePicker {
            return timeArray.count
        } else {
            return 1
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == countryPicker {
            return country_list[row]
        } else {
            return timeArray[component][row]
        }
            
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        if pickerView == countryPicker {
            return country_list.count
        } else {
            return timeArray[component].count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == countryPicker {
            tfCountry.text = country_list[row]
            print(country_list[row])
        } else {

        }
    
    }
     
}

//MARK: - Textfield delegate
extension UIPickerViewViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfCountry {
            setUpToolBar()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
    
}

//MARK: - Picker view delegate
extension UIPickerViewViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//    
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//         
//        view.backgroundColor = .blue
//        return view
//    }
//    
}
