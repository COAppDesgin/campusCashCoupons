//
//  MapViewController.swift
//  CampusCash
//
//  Created by Tyler Jordan Cagle on 9/27/17.
//  Copyright © 2017 Hans von Clemm. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var zoomButton: UIBarButtonItem!
    @IBOutlet weak var mapView: MKMapView!
    var coreLocationManager = CLLocationManager()
    var locationManager: LocationManager!
    
    var arrayOfCellData = [cellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.zoomButton.isEnabled = false
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(MapViewController.enableButton), userInfo: nil, repeats: false)
        
        // hard coded
        arrayOfCellData = [cellData(cell: 1, companyText: "Cosmos", addressText: "659 30th St, Boulder", phoneNumberText: "303-447-1133", websiteText: "cosmospizza.com", couponImage: #imageLiteral(resourceName: "Cosmos"), companyImage: #imageLiteral(resourceName: "Cosmos Pizza"), companyColor: "blue"),
                           cellData(cell: 1, companyText: "Half Fast Subs", addressText: "1215 13th Street, Boulder", phoneNumberText: "303-449-0404", websiteText: "halffastsubs.com", couponImage: #imageLiteral(resourceName: "Half Fast Subs"), companyImage: #imageLiteral(resourceName: "Half Fast Subs-1"), companyColor: "red"),
                           cellData(cell: 1, companyText: "The Corner", addressText: "1100 13th St, Boulder", phoneNumberText: "720-398-8331", websiteText: "thecornerboulder.com", couponImage: #imageLiteral(resourceName: "The Corner"), companyImage: #imageLiteral(resourceName: "The Corner-1"), companyColor: "grey")]
        //waiting for database
        
        
        coreLocationManager.delegate = self

        mapView.showsUserLocation = true
        locationManager = LocationManager.sharedInstance
        
        let authorizationCode = CLLocationManager.authorizationStatus()
        
        if authorizationCode == CLAuthorizationStatus.notDetermined && coreLocationManager.responds(to: #selector(CLLocationManager.requestAlwaysAuthorization)) || coreLocationManager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)) {
            if Bundle.main.object(forInfoDictionaryKey: "NSLocationAlwaysUsageDescription") != nil {                coreLocationManager.requestAlwaysAuthorization()
            } else {
                self.zoomButton.isEnabled = false
            }
        } else {
            getLocation()
        }
        getLocation()
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func getLocation() {
        locationManager.startUpdatingLocationWithCompletionHandler { (latitude, longitude, status, verboseMessage, error) -> () in
            self.displayLocation(location: CLLocation(latitude: latitude, longitude: longitude))
            self.mapView.setCenter(CLLocationCoordinate2DMake(latitude, longitude), animated: true)
//            self.mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(latitude, longitude), 1500, 1500), animated: true)
        }
    }
    
    func displayLocation(location: CLLocation) {
        
        let locationPinCoord = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationPinCoord
        
        //displays the annotation for coupon locations
        for i in 0 ..< arrayOfCellData.count  {
            
            let address = arrayOfCellData[i].addressText
            
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(address!) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let locationComp = placemarks.first?.location
                else {
                    print("No coordinates found..")
                    return
                }
                
                let lat = locationComp.coordinate.latitude
                let lon = locationComp.coordinate.longitude
                print("Lat: \(lat), Lon: \(lon)")
                
                let locationPinCoord2 = CLLocationCoordinate2DMake(lat, lon)

                let annotation2 = MKPointAnnotation()
                annotation2.coordinate = locationPinCoord2
                annotation2.title = self.arrayOfCellData[i].companyText
                
                self.mapView.addAnnotation(annotation2)
//                self.mapView.addAnnotation(annotation)
//                self.mapView.showAnnotations([annotation2], animated: false)
//                self.mapView.selectAnnotation(annotation2, animated: true)
            }
        }
        //end of displaying the annotation for coupon locations
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.notDetermined || status != CLAuthorizationStatus.denied || status != CLAuthorizationStatus.restricted {
            getLocation()
        }
    }
    
    @IBAction func zoomButtonPressed(_ sender: Any) {
        let userLocation = mapView.userLocation
        let region = MKCoordinateRegionMakeWithDistance((userLocation.location?.coordinate)!, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        for i in 0 ..< arrayOfCellData.count {
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
            leftIconView.image = UIImage(cgImage: self.arrayOfCellData[i].companyImage as! CGImage)
            annotationView?.leftCalloutAccessoryView = leftIconView
        }
        
        return annotationView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enableButton() {
        self.zoomButton.isEnabled = true
    }
}
