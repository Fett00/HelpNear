//
//  NavigationWorker.swift
//  HelpNear

import Foundation
import CoreLocation

protocol LocationWorkerProtocol{
    
    func requestPermissionIfDisabled()
}

//Работа с данными геопозиции
final class LocationWorker: NSObject, LocationWorkerProtocol{
    
    private lazy var locationManager: CLLocationManager = {
       
        let manager = CLLocationManager()
        manager.delegate = self
        
        return manager
    }()
    
    func requestPermissionIfDisabled() {
        
        self.locationManager.requestAlwaysAuthorization()
    }
}

extension LocationWorker: CLLocationManagerDelegate{

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        print("LOCATION")
    }
}
