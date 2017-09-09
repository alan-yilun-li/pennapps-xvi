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

// A structure representing a target that the user must find.
struct Target {
    
    static var current: Target!
    
    var photo: UIImage!
    
    var coordinates: CLLocationCoordinate2D!
    
    var distance: Double!
    
}
