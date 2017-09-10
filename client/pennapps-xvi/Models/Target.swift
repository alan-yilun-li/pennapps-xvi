//
//  Target.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-09.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

// A structure representing a target that the user must find.
class Target {
    
    static var current: Target?
    
    static var timeLabel: UILabel!
    
    let pin: MKAnnotation
    
    let location: CLLocation
    
    var photo: UIImage!
    
    var stopWatch: Timer!
    
    /// Time in seconds
    private var time: Int = 0

    init(pin: MKAnnotation) {
        self.pin = pin
        self.location = CLLocation(latitude: pin.coordinate.latitude, longitude: pin.coordinate.longitude)
        
    }
    
    func startTimer() {
        stopWatch = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [unowned self] _ in
            
            self.time += 1
            
            let seconds = Int(self.time) % 60
            let minutes = Int(self.time / 60) % 60
            
            let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
            let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"
            
            Target.timeLabel.text = "Time: \(minutesString):\(secondsString)"
        })
    }
    
}
