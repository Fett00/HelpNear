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
            
            self.dataWorker.requestEvents { models in
                
                self.data = []
                
                for model in models {
                    
                    if let location = model.location {
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        
                        self.data.append(LocationModel(annotation: annotation) )
                    }
                }
            }
            handler()
        }
    }
}
