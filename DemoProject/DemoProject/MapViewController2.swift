//
//  SongViewController.swift
//  DemoProject
//
//  Created by Devarsh Bhalara on 19/04/23.
//

import UIKit
import MapKit

class MapViewController2: UIViewController {
    
   
    //MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Variables
    let myRegion = CLLocationManager()
    let coordinates = [
        CLLocationCoordinate2D(latitude: 22.312065794253503, longitude: 69.59685893261282),
        CLLocationCoordinate2D(latitude: 22.083254732634973, longitude:   69.58184086491825 ),
        CLLocationCoordinate2D(latitude: 22.251587743066928, longitude: 69.91060467615233),
        CLLocationCoordinate2D(latitude: 21.823776157749226, longitude: 70.06550301029145)
    ]
    var locationManager = CLLocationManager()
    let bakeryAnnotation = MKPointAnnotation()
    let customAnnotation = MKPointAnnotation()
    let hotelAnnotation = MKPointAnnotation()
    var initialLocation = CLLocation(latitude: 22.27442034550032, longitude: 70.80545380909834)
    var bakeyShopLocation = CLLocation(latitude: 22.277333072986966, longitude: 70.80656230768155)
    var hotelLocation = CLLocation(latitude: 22.27561030652118, longitude: 70.805389162853)
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        mapView.showsUserLocation = true
        mapView.delegate = self
        let overlay = CustomOverlay(coordinates: self.coordinates, count: coordinates.count)
        mapView.addOverlay(overlay)
        mapView.preferredConfiguration = MKHybridMapConfiguration()
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true
        mapView.isPitchEnabled = true
        mapView.showsBuildings = true
        myRegion.delegate = self
        myRegion.requestAlwaysAuthorization()
        /** Creating center camera view */
//        let mapcamera = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: hotelLocation.coordinate.latitude, longitude: hotelLocation.coordinate.longitude), fromDistance: 500, pitch: 60, heading: 0.0)
//        mapView.camera = mapcamera
//        mapView.setCamera(mapcamera, animated: true)
        mapView.register(MyAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        checkLocationServices()
        centerLocation()
        /** Setting initial view how much portion to display on map **/
        //cameraBoundary()
        /** this is normal annotation with title and subtitle **/
        //addAnnotation()
        addCustomAnnotation()
        showRouteOnMap(pickupCoordinate: hotelAnnotation.coordinate, destinationCoordinate: bakeryAnnotation.coordinate)
        createRegion()
        let distance = bakeyShopLocation.distance(from: hotelLocation) / 1000
        print("Distance = \(String(format:"%.02f", distance)) KMs")
    }
    
    func createRegion() {
        let myCoordinate = CLLocationCoordinate2D(latitude: 22.274992457213102, longitude: 70.80532688859402)
        let region = CLCircularRegion(center: myCoordinate, radius: 100, identifier: "myArea")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        myRegion.startMonitoring(for: region)
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            self.checkLocationAuth()
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

        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    
    func centerLocation() {
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
    
    func cameraBoundary() {
        
        let region = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 2000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func addAnnotation() {
        annotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        annotation.title = "My location"
        mapView.addAnnotation(annotation)
    }
    
    func addCustomAnnotation() {
        bakeryAnnotation.title = "Patel Bakery"
        bakeryAnnotation.subtitle = "Cakes, chocolates..."
        bakeryAnnotation.coordinate = CLLocationCoordinate2D(latitude: bakeyShopLocation.coordinate.latitude, longitude: bakeyShopLocation.coordinate.longitude)
        mapView.addAnnotation(bakeryAnnotation)
        customAnnotation.title = "Home"
        customAnnotation.coordinate = CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude)
        mapView.addAnnotation(customAnnotation)
        hotelAnnotation.title = "Hotel"
        hotelAnnotation.subtitle = "Food..."
        hotelAnnotation.coordinate = CLLocationCoordinate2D(latitude: hotelLocation.coordinate.latitude, longitude: hotelLocation.coordinate.longitude)
        mapView.addAnnotation(hotelAnnotation)
    }
}

//MARK: - CLLocationManagerDelegate
extension MapViewController2: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("did update")
        print(locations.last!)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Enter region")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("exit region")
    }
    
}

//MARK: - Custom Annotaion class
class CustomAnnotation: MKPointAnnotation {
    var type: String?
    var imaage: UIImage? = UIImage(systemName: "house")!
}

//MARK: - MKMapViewDelegate

extension MapViewController2: MKMapViewDelegate {
    
    /**Getting a route **/
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            print("Total route found are \(unwrappedResponse.routes.count)")
            
            if let route = unwrappedResponse.routes.first {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets.init(top: 80.0, left: 20.0, bottom: 100.0, right: 20.0), animated: true)
            } else {
                print("not found")
            }
        }
    }
                
    /**Rendering a route**/
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if let overlay = overlay as? CustomOverlay {
            let renderer = MKPolygonRenderer(overlay: overlay)
            renderer.fillColor = UIColor.orange.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.black
            
            return renderer
        }
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 5.0
        return renderer
    }
    
    /**Annotation with custiom view **/
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKPointAnnotation {
            
            let identifier = MKMapViewDefaultAnnotationViewReuseIdentifier
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MyAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
            } else {
                annotationView?.annotation = annotation
            }
        
            if annotation.title == "Hotel" {
             
                let customView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
                let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
                myImageView.image = UIImage(named: "burger-king")
                customView.addSubview(myImageView)
                annotationView?.leftCalloutAccessoryView = customView
                
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 70))
                label.text = """
                Welcome to out hotel,
                Burger, pizza all type of fastfood available
                """
                label.textColor =  .gray
                label.numberOfLines = 0
                annotationView?.detailCalloutAccessoryView = label
                
                
            } else if annotation.title == "Home" {
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 70))
                label.text = """
                This is our home,
                3/10 Gaytri nagar
                """
                label.textColor =  .gray
                label.numberOfLines = 0
                annotationView?.detailCalloutAccessoryView = label
            } else {
               
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 70))
                label.text = """
                Cakes, Chocolates,
                all type of bakery item
                """
                label.textColor =  .gray
                label.numberOfLines = 0
                annotationView?.detailCalloutAccessoryView = label
            }
            
            return annotationView
        } else {
            return nil
        }
        
    }
    
    /**Annotation with images **/
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        if annotation is CustomAnnotation {
//
//            let reuseId = "CustomAnnotation"
//            var aView = mapView.dequeueReusableAnnotationView(withIdentifier: "CustomAnnotation")
//
//            if aView == nil {
//                aView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//                aView?.canShowCallout = true
//                let customView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 30))
//                let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//                myImageView.image = UIImage(systemName: "person")
//                customView.addSubview(myImageView)
//                aView?.rightCalloutAccessoryView = customView
////                aView?.detailCalloutAccessoryView = customView
//
//            } else {
//                aView?.annotation = annotation
//                
//            }
//
//            guard let customAnnotation = annotation as? CustomAnnotation, let image = customAnnotation.imaage else {
//                return nil
//            }
//            aView?.image = image
//            return aView
//        } else {
//            return nil
//        }
//    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print("did change visible range")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("will start loading map")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("did finish loading map")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("tapped")
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("did select")
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        print("did deselect")
    }
}

