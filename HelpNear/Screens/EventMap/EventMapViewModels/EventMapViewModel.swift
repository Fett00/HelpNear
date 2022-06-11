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
    
    var data: [LocationModel] { get }
}

class EventMapViewModel: EventMapViewModelProtocol{
    
    private var dataWorker: EventsDataWorkerProtocol!
    
    private(set) var data: [LocationModel] = []
    
    init(dataWorker: EventsDataWorkerProtocol) {
        
        self.dataWorker = dataWorker
    }
    
    func requestEventsViewModelForMap(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.data = []
            
            for _ in 0..<10{
                
                let annotation = MKPointAnnotation()
                let latitude = Double.random(in: 0...10)
                let longitude = Double.random(in: 0...10)
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                let model = LocationModel(annotation: annotation)
                
                self.data.append(model)
            }
            handler()
        }
    }
}
