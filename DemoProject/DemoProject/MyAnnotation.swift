//
//  MyAnnotation.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 24/04/23.
//

import Foundation
import MapKit
class MyAnnotation: NSObject, MKAnnotation {

    let coordinate: CLLocationCoordinate2D  
    let title: String?
    let subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
