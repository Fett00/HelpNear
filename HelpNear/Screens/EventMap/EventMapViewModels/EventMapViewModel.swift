//
//  EventMapViewModel.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation
import MapKit

protocol EventMapViewModelProtocol{
    
    func requestEventsViewModelForMap(handler: @escaping ()->())
    
    func updatingCurrentLocation(ever seconds: UInt, notificator: @escaping ()->())
    
    func requestGeopositionPermission()
    
    var data: [LocationModel] { get }
}

class EventMapViewModel: EventMapViewModelProtocol{
    
    private let dataWorker: EventsDataWorkerProtocol
    private let locationWorker: LocationWorkerProtocol
    
    private(set) var data: [LocationModel] = []
    
    init(dataWorker: EventsDataWorkerProtocol, locationWorker: LocationWorkerProtocol) {
        
        self.dataWorker = dataWorker
        self.locationWorker = locationWorker
    }
    
    func requestEventsViewModelForMap(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.dataWorker.requestEvents { models in
                
                self.data = []
                
                for model in models {
                    
                    if let location = model.location {
                        
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        
                        self.data.append(LocationModel(annotation: annotation) )
                    }
                }
                handler()
            }
        }
    }
    
    func updatingCurrentLocation(ever seconds: UInt, notificator: @escaping ()->()){
        
    }
    
    func requestGeopositionPermission(){
        
        //self.locationWorker.requestPermissionIfDisabled()
    }
}
