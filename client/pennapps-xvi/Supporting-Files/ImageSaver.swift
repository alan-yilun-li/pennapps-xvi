//
//  ImageSaver.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-10.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import Foundation
import UIKit

class ImageSaver {
    
    static let shared = ImageSaver()
    
    private init() {}
    
    private let fileDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
    
    var targetImageName = "target.jpg"
    
    var ownImageName = "own.jpg"
    
    var targetImageURL: URL {
        let location = fileDirectory!.appendingPathComponent(targetImageName, isDirectory: false)
        return location
    }
    
    var ownImageURL: URL {
        let location = fileDirectory!.appendingPathComponent(ownImageName, isDirectory: false)
        return location
    }
    
    func saveTargetImage(image: UIImage) {
        do {
            try UIImageJPEGRepresentation(image, 1.0)!.write(to: targetImageURL, options: [.atomic])
        } catch (let error) {
            print("error: \(error)")
        }
    }
    
    func saveTakenImage(image:UIImage) {
        do {
            try UIImageJPEGRepresentation(image, 1.0)!.write(to: ownImageURL, options: [.atomic])
        } catch (let error) {
            print("error: \(error)")
        }
    }
}
