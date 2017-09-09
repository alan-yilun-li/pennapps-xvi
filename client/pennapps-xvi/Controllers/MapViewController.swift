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
import GameplayKit

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
        
        print("hello!")
    }

}


// MARK: - MKMapViewDelegate Methods and other MapView related functions
extension MapViewController: MKMapViewDelegate {
    
    fileprivate func setup(mapView: MKMapView) {
        mapView.delegate = self
        mapView.setUserTrackingMode(.followWithHeading, animated: false)
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

























