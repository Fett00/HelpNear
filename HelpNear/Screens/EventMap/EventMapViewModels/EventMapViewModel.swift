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
    
    func createEventForPresent(with id: String, handler: @escaping (EventCollectionModel) -> ())
    
    func requestGeopositionPermission()
    
    var data: [EventMapAnnotation] { get }
}

class EventMapViewModel: EventMapViewModelProtocol{
    
    private let dataWorker: EventsDataWorkerProtocol
    private let locationWorker: LocationWorkerProtocol
    
    private(set) var data: [EventMapAnnotation] = []
    
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
                        
                        let annotation = EventMapAnnotation()
                        annotation.coordinate = location
                        annotation.title = model.title
                        annotation.subtitle = model.description
                        annotation.id = model.id
                        
                        self.data.append(annotation)
                        //self.data.append(LocationModel(title: model.title, annotation: annotation) )
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
    
    func createEventForPresent(with id: String, handler: @escaping (EventCollectionModel) -> ()){
        
        dataWorker.requestEvent(with: id) { model in
            
            let event = EventCollectionModel(title: model.title, description: model.description, salary: "\(model.rewardAmount ?? -1)")
            
            handler(event)
        }
    }
}
