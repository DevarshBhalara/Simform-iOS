//
//  MapCustomViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 25/04/23.
//

import UIKit
import MapKit

class MapCustomViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    //MARK: - Variables
    var initialLocation = CLLocation(latitude: 22.27442034550032, longitude: 70.80545380909834)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        setUpUI()
        mapView.delegate = self
        centerLocation()
        myAnnotation()
    }
    
    private func myAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        annotation.title = "Home"
        annotation.subtitle = "Gaytri nagar 3/10"
        mapView.addAnnotation(annotation)
    }
    
    func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
}
extension MapCustomViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        if view.annotation!.isKind(of: MKUserLocation.self){
            return
        }
        //Custom xib
        let customView = (Bundle.main.loadNibNamed("CallOut", owner: self, options: nil))![0] as! CallOut;
        customView.lblTitle.text = view.annotation?.title ?? "NA"
        customView.imgView.image = UIImage(named: "street")
        customView.lblSubtitle.text = view.annotation?.subtitle ?? "NA"
        let calloutViewFrame = customView.frame;
        customView.frame = CGRect(x: -calloutViewFrame.size.width/2.23, y: -calloutViewFrame.size.height-7, width: 315, height: 230)
        view.addSubview(customView)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        var customView = view.subviews
        for i in 0...customView.count - 1 {
            if customView[i] is CallOut {
                customView[i].isHidden = true
            }
        }
    }
    
}
