//
//  CustomTraitCollectionViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 04/04/23.
//

import UIKit

class CustomTraitCollectionViewController: UIViewController {
    
    override var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .Pad && UIDevice.current.orientation.isPortrait.boolVal {
            return UITraitCollection(traitsFrom:
                                        [UITraitCollection(horizontalSizeClass: .compact),
                                        [UITraitCollection(verticalSizeClass: .regular)])
        }
                                         return super.traitCollection
    }
        
    }

    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
