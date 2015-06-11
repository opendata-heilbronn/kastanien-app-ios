//
//  ViewController.swift
//  KastanienApp
//
//  Created by Adrian Stabiszewski on 11.06.15.
//  Copyright (c) 2015 OpenData Heilbronn. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapKit: MKMapView!
    var locationManager:CLLocationManager!
    var locationStatus : NSString = "Not Started"


    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let authStatus = CLLocationManager.authorizationStatus()
        if (authStatus == CLAuthorizationStatus.NotDetermined) {
            locationManager.requestWhenInUseAuthorization()
        } else {
            self.locationManager(locationManager, didChangeAuthorizationStatus: authStatus)
        }

        mapKit.delegate = self
    }

    func locationManager(manager: CLLocationManager!,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            var shouldIAllow = false

            switch status {
            case CLAuthorizationStatus.Restricted:
                locationStatus = "Restricted Access to location"
            case CLAuthorizationStatus.Denied:
                locationStatus = "User denied access to location"
            case CLAuthorizationStatus.NotDetermined:
                locationStatus = "Status not determined"
            default:
                locationStatus = "Allowed to location Access"
                shouldIAllow = true
            }
            if (shouldIAllow == true) {
                NSLog("Location to Allowed")
                mapKit.showsUserLocation = true
            } else {
                NSLog("Denied access: \(locationStatus)")
            }
    }
}

