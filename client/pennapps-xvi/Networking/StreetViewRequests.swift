//
//  StreetViewRequests.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-10.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import Foundation
import Alamofire

private let key = APIKeys.GOOGLE_API_KEY

class StreetViewRequest {
    
    static func makeRequest(forTarget target: Target) {
        
        let coordinate = target.location.coordinate
        
        let parameters: Parameters = [
            "location": "\(coordinate.latitude), \(coordinate.longitude)",
            "size": "800x800",
            "key": key
        ]
        
        Alamofire.request("https://maps.googleapis.com/maps/api/streetview", method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).response(completionHandler: { (response) in
            
            print(response)
        })
    }
    
    
}
