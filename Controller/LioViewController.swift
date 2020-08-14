//
//  LioViewController.swift
//  LioApp
//
//  Created by Quentin Marlas on 13/08/2020.
//  Copyright © 2020 Quentin Marlas. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LioViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var lioMapKit: MKMapView!
    
    // San José Capitale du Costa Rica pour centrer la carte
    var latitudeInit: Double = 9.998784
    var longitudeInit: Double = -84.204007
    var coordinateInit :  CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitudeInit, longitude: longitudeInit)
    }
    let locationManager = CLLocationManager()
    var userPosition: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let span = MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3)
        let region = MKCoordinateRegion(center: coordinateInit, span: span)
        lioMapKit.showsUserLocation = true
        lioMapKit.setRegion(region, animated: true)
        lioMapKit.delegate = self
        lioMapKit.isRotateEnabled = true
        
        lioMapKit.showsUserLocation = true
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        locationManager.startUpdatingHeading()

    }
    
    @IBAction func getPosition(_ sender: Any) {
        print("getPosition")
        if userPosition != nil {
            setupMap(coordonnees: userPosition!.coordinate, myLat: 1, myLong: 1)
        } else {
            print("nil dans getPosition")
        }
    }

    // si mise à jour des locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            if let maPosition = locations.last {
                userPosition = maPosition
            }
        }
    }
    
    // appellé par le bouton "localise moi"
    func setupMap(coordonnees: CLLocationCoordinate2D, myLat: Double, myLong: Double) {
        let span = MKCoordinateSpan(latitudeDelta: myLat , longitudeDelta: myLong)
        let region = MKCoordinateRegion(center: coordonnees, span: span)
        lioMapKit.setRegion(region, animated: true)
    }
}

