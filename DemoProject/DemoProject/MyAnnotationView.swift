//
//  MyAnnotationView.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 24/04/23.
//

import Foundation
import MapKit

class MyAnnotationView: MKAnnotationView {
    
    private let annotationFrame = CGRect(x: 0, y: 0, width: 40, height: 40)
    var type: String?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.frame = annotationFrame
        self.backgroundColor = .clear
        self.canShowCallout = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
            guard let context = UIGraphicsGetCurrentContext() else { return }

            context.beginPath()
            context.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            context.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            context.closePath()

            UIColor.red.set()
            context.fillPath()
        }
    
}
