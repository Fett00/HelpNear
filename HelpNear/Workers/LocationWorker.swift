//
//  NavigationWorker.swift
//  HelpNear

import Foundation
import CoreLocation

protocol LocationWorkerProtocol{
    
    func requestPermissionIfDisabled()
    func currentLocationStream(notificator: @escaping ()->())
    func startUpdatingLocation()
    func stopUpdatingLocation()
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
    
    func startUpdatingLocation(){
        
        self.locationManager.startUpdatingLocation()
    }
    func stopUpdatingLocation(){
        
        self.locationManager.stopUpdatingLocation()
    }
    
    func currentLocationStream(notificator: @escaping ()->()){
        
    }
    
    private func hasPermission(){
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
            case .authorizedAlways:
                print("authorizedAlways")
            case .authorizedWhenInUse:
                print("authorizedWhenInUse")
            case .denied, .notDetermined, .restricted:
                print("denied")
        }
    }
}

extension LocationWorker: CLLocationManagerDelegate{

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
            case .authorizedAlways:
                print("authorizedAlways")
            case .authorizedWhenInUse:
                print("authorizedWhenInUse")
            case .denied, .notDetermined, .restricted:
                print("denied")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
}
