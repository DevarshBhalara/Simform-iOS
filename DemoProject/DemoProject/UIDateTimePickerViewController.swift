//
//  UIDateTimePickerViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 20/04/23.
//

import UIKit

class UIDateTimePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
    
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func getDate(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeStyle = .full
        print(dateFormatter.string(from: datePicker.date))
    }
}
