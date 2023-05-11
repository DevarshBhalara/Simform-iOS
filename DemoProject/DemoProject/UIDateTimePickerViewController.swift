//
//  UIDateTimePickerViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/04/23.
//

import UIKit

class UIDateTimePickerViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        datePicker.backgroundColor = .blue
        datePicker.tintColor = .white
    }

    @IBAction func datePickerValueChange(_ sender: UIDatePicker) {
        print(sender.date)
        
    }
    
    @IBAction func getDate(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeStyle = .full
        print(dateFormatter.string(from: datePicker.date))
    }
}
