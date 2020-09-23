//
//  LioViewController.swift
//  LioApp
//
//  Created by Quentin Marlas on 04/09/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import MapKit
import UIKit

class LioViewController: UIViewController {

    @IBOutlet weak var lioMapView: MKMapView!
    
    var location = SignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getSamButtonTapped(_ sender: UIButton) {

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
