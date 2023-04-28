//
//  DemoPickerViewViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 21/04/23.
//

import UIKit

class DemoPickerViewViewController: UIViewController {
    
    private var imagePicker = UIPickerView()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldImage: UITextField!
    @IBOutlet weak var buttonClicked: UIButton!
    @IBOutlet weak var textFieldPicker: UITextField!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var textFieldTime: UITextField!
    
    private let timePicker = UIDatePicker()
    private let datePicker = UIDatePicker()
    private let countryPicker = UIPickerView()
    private let imagePicker2 = UIPickerView()
    
    let dateFormatter = DateFormatter()
    
    var country_list = ["Afghanistan","Albania","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia"]
    
    let imageArray = [
        UIImage(named: "avtar"),
        UIImage(named: "13reason"),
        UIImage(named: "farzi"),
        UIImage(named: "elite") ]
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        setUpTimePicker()
        setUpDatePicker()
        setUpCustomPicker()
        setUpImagePicker()
        countryPicker.delegate = self
        countryPicker.dataSource = self
        imagePicker.delegate = self
        imagePicker.dataSource = self
        
    }
    
    private func setUpImagePicker() {
        textFieldImage.delegate = self
        textFieldImage.inputView = imagePicker
        let imagePickertoolbar = setUpToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(setImageTextField))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancleButton = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(cancleButtonImageTextField))
        imagePickertoolbar.setItems([cancleButton, spacer, doneButton, ], animated: true)
        
        textFieldImage.inputAccessoryView = imagePickertoolbar
    }
    
    private func setUpCustomPicker() {
        textFieldPicker.delegate = self
        textFieldPicker.inputView = countryPicker
        let pickerToolBar = setUpToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(setPickerTextField))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancleButton = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(cancleButtonPickerTextField))
        pickerToolBar.setItems([cancleButton, spacer, doneButton, ], animated: true)
        
        textFieldPicker.inputAccessoryView = pickerToolBar
    }
    
    private func setUpToolbar() -> UIToolbar {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))

        return toolBar
    }
    
    private func setUpTimePicker() {
        textFieldTime.delegate = self
        textFieldTime.inputView = timePicker
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        
        let toolBarTimePicker = setUpToolbar()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(setTimeTextField))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancleButton = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(cancleButtonTimeTextField))
        toolBarTimePicker.setItems([cancleButton, spacer, doneButton, ], animated: true)
        textFieldTime.inputAccessoryView = toolBarTimePicker
    }
    
    private func setUpDatePicker() {
        datePicker.minimumDate = Date()
        textFieldDate.delegate = self
        textFieldDate.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        let toolBarDatePicker = setUpToolbar()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(setDateTextField))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancleButton = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(cancleButtonDateTextField))
        toolBarDatePicker.setItems([cancleButton, spacer, doneButton, ], animated: true)
        textFieldDate.inputAccessoryView = toolBarDatePicker
    }
    
    @objc func setImageTextField() {
        textFieldImage.resignFirstResponder()
    }
    
    @objc func cancleButtonImageTextField() {
        textFieldImage.resignFirstResponder()
     
    }
    
    @objc func setPickerTextField() {
        textFieldPicker.resignFirstResponder()
    }
    
    @objc func cancleButtonPickerTextField() {
        textFieldPicker.text = ""
        textFieldPicker.resignFirstResponder()
    }
    
    @objc func setTimeTextField() {
        
        dateFormatter.dateFormat = "HH:mm"
        let result = dateFormatter.string(from: timePicker.date )
        textFieldTime.text = result
        textFieldTime.resignFirstResponder()
    }
    
    @objc func cancleButtonTimeTextField() {
        textFieldTime.text = ""
        textFieldTime.resignFirstResponder()
    }
    
    @objc func setDateTextField() {
        dateFormatter.dateFormat = "MM/dd/yy"
        let result = dateFormatter.string(from: datePicker.date)
        textFieldDate.text = result
        textFieldDate.resignFirstResponder()
    }
    
    @objc func cancleButtonDateTextField() {
        textFieldDate.text = ""
        textFieldDate.resignFirstResponder()
    }
    
    
    @IBAction func pickerImage(_ sender: UIButton) {
        imagePicker.isHidden = false
    }
    
    
 
}

extension DemoPickerViewViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}

extension DemoPickerViewViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if pickerView == imagePicker {
            return 100
        } else {
            return 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        if pickerView == imagePicker {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
            let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            myImageView.image = imageArray[row]
            print("img")
            view.addSubview(myImageView)
            return view
        }
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50) )
        label.textAlignment = .center
        label.text = country_list[row]
        view.addSubview(label)
        print(label.text ?? "")
        return view
        
    }
    
}
extension DemoPickerViewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == countryPicker {
            return country_list.count
        } else {
            return imageArray.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return country_list[row]
        } else {
            
            return ""
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   
            if pickerView == countryPicker {
                textFieldPicker.text = country_list[row]
            } else {
                imageView.image = imageArray[row]
            }
    }
    
    
}
