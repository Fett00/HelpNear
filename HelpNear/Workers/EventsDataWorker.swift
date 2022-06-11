//
//  EventMapDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation

protocol EventsDataWorkerProtocol{
    
    func requestEvents(handler: @escaping ([POIModel])->())
}

class EventsDataWorker: EventsDataWorkerProtocol{
    
    let coreDataWorker: CoreDataWorkerProtocol
    let networkWorker: NetworkWorkerProtocol
    let jsonWorker: JSONDecoderWorkerProtocol
    
    var events: [POIModel] = []
    
    init(coreDataWorker: CoreDataWorkerProtocol, networkWorker: NetworkWorkerProtocol, jsonWorker: JSONDecoderWorkerProtocol) {
        
        self.coreDataWorker = coreDataWorker
        self.networkWorker = networkWorker
        self.jsonWorker = jsonWorker
    }
    
    func requestEvents(handler: @escaping ([POIModel])->()){
        
        networkWorker.getData(from: URLs.eventsURL) { result in
            
            switch result{
                
            case .failure(let error):
                print(error)
            case .success(let data):
                guard let networkModels = self.jsonWorker.decode(type: [POINetworkModel].self, data: data) else { return }
                self.events = ModelsConverter.poiFromNetworkToModel(from: networkModels)
            }
            handler(self.events)
        }
    }
}
