//
//  MySegue.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 03/05/23.
//

import UIKit
class MySegue: UIStoryboardSegue {
    
    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
    }
    
    override func perform() {
        if let firstVCView = self.source.view, let destinationVCView = self.destination.view {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            destinationVCView.frame = CGRect(x: 0, y: screenHeight, width: screenWidth, height: screenHeight)
            let window = UIApplication.shared.keyWindow
            window?.insertSubview(destinationVCView, aboveSubview: firstVCView)
            
            UIView.animate(withDuration: 0.4) {
                firstVCView.frame = firstVCView.frame.offsetBy(dx: 0, dy: -screenHeight)
            }
            self.source.present(self.destination, animated: true)
        }
    }
}
