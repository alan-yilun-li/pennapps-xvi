//
//  ImageSaver.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-10.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import Foundation

class ImageSaver {
    
    static let shared = ImageSaver()
    
    private init() {}
    
    private let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
    
    var targetImageURL: URL {
        let location = URL(string: URL(fileURLWithPath: fileDirectory).appendingPathComponent("target.jpg", isDirectory: false))!
    }
    
    var ownImageURL: URL {
        let location = URL(string: URL(fileURLWithPath: fileDirectory).appendingPathComponent("own.jpg", isDirectory: false))!
    }
    
    func saveTargetImage(image: UIImage) {
        do {
            try UIImageJPEGRepresentation(newValue!, 1.0)!.write(to: targetImageURL, options: [.atomic])
        } catch (let error) {
            print("error: \(error)")
        }
    }
    
    func saveTakenImage(image:UIImage) {
        do {
            try UIImageJPEGRepresentation(newValue!, 1.0)!.write(to: ownImageURL, options: [.atomic])
        } catch (let error) {
            print("error: \(error)")
        }
    }
}
