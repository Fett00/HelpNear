//
//  EventMapViewModel.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation

protocol EventMapViewModelProtocol{
    
    func requestEventsViewModelForMap(handler: @escaping ()->())
}

class EventMapViewModel: EventMapViewModelProtocol{
    
    private var dataWorker: EventsDataWorkerProtocol!
    
    init(dataWorker: EventsDataWorkerProtocol) {
        
        self.dataWorker = dataWorker
    }
    
    func requestEventsViewModelForMap(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            handler()
        }
    }
}
