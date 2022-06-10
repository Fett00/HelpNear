//
//  EventCollectionDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 10.06.2022.
//

import Foundation

protocol EventCollectionDataWorkerProtocol{
    
    func requestEvents(handler: @escaping ()->())
    
    var data: [POIModel] { get }
}

class EventCollectionDataWorker: EventCollectionDataWorkerProtocol{
    
    let coreDataWorker: CoreDataWorkerProtocol
    let networkWorker: NetworkWorkerProtocol
    let jsonWorker: JSONDecoderWorkerProtocol
    
    private(set) var data: [POIModel] = []
    
    init(coreDataWorker: CoreDataWorkerProtocol, networkWorker: NetworkWorkerProtocol, jsonWorker: JSONDecoderWorkerProtocol) {
        
        self.coreDataWorker = coreDataWorker
        self.networkWorker = networkWorker
        self.jsonWorker = jsonWorker
    }
    
    
    func requestEvents(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            handler()
        }
    }
}
