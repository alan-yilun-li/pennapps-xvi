//
//  PhotoViewController.swift
//  pennapps-xvi
//
//  Created by Alan Li on 2017-09-09.
//  Copyright © 2017 Alan Li. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewCustomizer.setup(navigationBar: navigationController?.navigationBar)
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

    @IBAction func getStreetViewTapped(_ sender: Any) {
        
        if let target = Target.current {
            
            StreetViewRequest.makeRequest(forTarget: target)
        } else {
            
            let noTargetAlert = UIAlertController(title: "No Target!", message: "There is no target to get a street view of. Sorry!" , preferredStyle: .alert)
            noTargetAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            present(noTargetAlert, animated: true)
        }
        
    }
}
















