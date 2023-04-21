//
//  SongViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/04/23.
//

import UIKit
import MapKit

class MapViewController2: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var initialLocation = CLLocation(latitude: 23.039545386753883, longitude: 72.48156305534161)
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        mapView.showsUserLocation = true
        super.viewDidLoad()
        checkLocationServices()
        centerLocation()
        cameraBoundary()
        addAnnotation()
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            self.checkLocationAuth()
        } else {
            
        }
    }
    
    func checkLocationAuth() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case . denied:
            break
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            mapView.showsUserLocation = true
            break
        default:
            break
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    
    func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func cameraBoundary() {
//        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
//        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
////
//        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 2000)
//        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func addAnnotation() {
       
        annotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        annotation.title = "My location"
        mapView.addAnnotation(annotation)
    }
    
    


}
extension MapViewController2: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did update")
        print(locations.last!)
    }
}

class CustomAnnotation: MKPointAnnotation {
    var imaage = UIImage(systemName: "home")
}
