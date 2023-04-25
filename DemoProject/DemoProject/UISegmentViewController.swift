//
//  UISegmentViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 11/04/23.
//

import UIKit

class UISegmentViewController: UIViewController {

    @IBOutlet private weak var segmentOne: UISegmentedControl!
    
    @IBOutlet private weak var clickSegment: UISegmentedControl!
    
    @IBOutlet private weak var dividerImage: UISegmentedControl!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configuredSegment()
        
        var radius = 20.0
        clickSegment.layer.cornerRadius = radius
        clickSegment.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }
    
    func configuredSegment() {
        clickSegment.setImage(UIImage(systemName: "alarm"), forSegmentAt: 0)
        clickSegment.setImage(UIImage(systemName: "stopwatch"), forSegmentAt: 1)
        clickSegment.setImage(UIImage(systemName: "timer"), forSegmentAt: 2)
        
        dividerImage.setDividerImage(UIImage(systemName: "plus"), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
    }
    

    @IBAction func onClickAddNew(_ sender: UIButton) {
   
        clickSegment.insertSegment(withTitle: "Hello", at: 3, animated: true)
        
    }
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 :
            print("Movies")
        case 1:
            print("Series")
        default :
            break
        }
        print(sender.isEnabledForSegment(at: 1))
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
