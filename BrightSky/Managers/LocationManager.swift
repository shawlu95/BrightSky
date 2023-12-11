//
//  LocationManager.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import CoreLocation
import Foundation

final class LocationManager: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    private var locationFetchCompletion: ((CLLocation) -> Void)?
    private var location: CLLocation? {
        didSet {
            // call the callback when location is set
            guard let location = location else {
                return
            }
            locationFetchCompletion?(location)
        }
    }
    
    static let shared = LocationManager()
    
    public func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        // pass in a callback, to be executed when setting location
        self.locationFetchCompletion = completion
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.location = location
        // save user battery life
        manager.stopUpdatingLocation()
    }
}
