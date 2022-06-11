//
//  EventMapDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation

protocol EventsDataWorkerProtocol{
    
    func requestEvents(handler: @escaping ()->())
}

class EventsDataWorker: EventsDataWorkerProtocol{
    
    let coreDataWorker: CoreDataWorkerProtocol
    let networkWorker: NetworkWorkerProtocol
    let jsonWorker: JSONDecoderWorkerProtocol
    
    let events: [POIModel] = []
    
    init(coreDataWorker: CoreDataWorkerProtocol, networkWorker: NetworkWorkerProtocol, jsonWorker: JSONDecoderWorkerProtocol) {
        
        self.coreDataWorker = coreDataWorker
        self.networkWorker = networkWorker
        self.jsonWorker = jsonWorker
    }
    
    func requestEvents(handler: @escaping ()->()){
        
        networkWorker.getData(from: URLs.eventsURL) { result in
            
            
        }
    }
}
