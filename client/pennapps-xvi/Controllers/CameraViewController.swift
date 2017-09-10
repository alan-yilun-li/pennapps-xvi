//
//  CameraViewController.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-10.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import UIKit
import algorithmia

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewCustomizer.setup(navigationBar: navigationController?.navigationBar)
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        present(imagePicker, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CameraViewController: UINavigationControllerDelegate {}


extension CameraViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        ImageSaver.shared.saveTakenImage(image: image)
        
        dismiss(animated: true, completion: { [unowned self] _ in
            
            LoadingView.showLoadingIndicator(onView: self.view, message: "Checking Photo")
        })
        
        AppDelegate.storage.put(file: ImageSaver.shared.ownImageURL, completion: { (file, err) in
            print(err)
            
        })
        
        
        AppDelegate.storage.put(file: ImageSaver.shared.targetImageURL, completion: { (file, err) in
            print(err)
            
        })
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { _ in
        
            let input = "[\"data://.my/storage/\(ImageSaver.shared.ownImageName)\",\"data://.my/storage/\(ImageSaver.shared.targetImageName)\"]"
            
            print("INPUT: \(input)")
            let client = Algorithmia.client(simpleKey: "sim+LlkWn9DHbQcXkiK8W8l1PQP1")
            let algo = client.algo(algoUri: "zskurultay/ImageSimilarity/0.1.4").pipe(rawJson: input, completion: { (resp, err) in
                
                print(resp)
                
                if let error = err {
                    print(error)
                }
            })
        })
    }
    
    
    
}
