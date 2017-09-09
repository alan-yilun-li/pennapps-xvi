//
//  MapViewController.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-09.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addTargetButton: UIButton!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    
    // MARK: - Variables
    
    var locationManager: CLLocationManager!
    
    // MARK: - ViewController LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        ViewCustomizer.setup(navigationBar: navigationController?.navigationBar)
        setup(mapView: mapView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Misc UI Functions
    func updateCoordinateLabels(with coordinate: CLLocationCoordinate2D) {
        latitudeLabel.text = "Latitude: \(coordinate.latitude)"
        longitudeLabel.text = "Longitude: \(coordinate.longitude)"
    }
    
    // MARK: - IBActions 

    @IBAction func addTarget(_ sender: Any) {
        
        print("Attempting to add annotation; currently \(mapView.annotations.count) annotations")
        
        if mapView.annotations.count > 1 {
            
            let wipeoutAlert = UIAlertController(title: "Warning!", message: "You already have a current target. Give up and select a new one?", preferredStyle: .alert)
            
            wipeoutAlert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { [unowned self] _ in
                self.giveNewTarget()
            }))
            wipeoutAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            present(wipeoutAlert, animated: true)
            
        } else {
        
            giveNewTarget()
        }
        
    }
    
    private func giveNewTarget() {
        
        let targetCoordinate = mapView.userLocation.coordinate.randomize()
        mapView.removeAnnotations(mapView.annotations)
        
        let mapAnnotation = MKPointAnnotation()
        mapAnnotation.coordinate = targetCoordinate
        mapAnnotation.title = "TARGET_PIN"
    
        mapView.addAnnotation(mapAnnotation)
    }

}


// MARK: - MKMapViewDelegate Methods and other MapView related functions
extension MapViewController: MKMapViewDelegate {
    
    fileprivate func setup(mapView: MKMapView) {
        mapView.delegate = self
        mapView.setUserTrackingMode(.followWithHeading, animated: false)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if (annotation.title != nil) && (annotation.title! == "TARGET_PIN") {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pinview")
            view.animatesDrop = true
            return view 
        } else {
            return nil
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        print("Updating user location")
        updateCoordinateLabels(with: userLocation.coordinate)
    }
    /*
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        
        print("Did start locating user")
        let userLocation = mapView.userLocation
        coordinatesLabel.text = "Latitude: \(userLocation.coordinate.latitude), Longitude: \(userLocation.coordinate.longitude)"
    }*/
    
}

























