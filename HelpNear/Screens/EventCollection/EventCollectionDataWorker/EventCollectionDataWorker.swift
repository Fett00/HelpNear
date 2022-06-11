//
//  EventCollectionDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation

protocol EventCollectionDataWorkerProtocol{
    
}

class EventCollectionDataWorker: EventCollectionDataWorkerProtocol {
    
    let coreDataWorker: CoreDataWorkerProtocol
    let networkWorker: NetworkWorkerProtocol
    let jsonWorker: JSONDecoderWorkerProtocol
    
    init(coreDataWorker: CoreDataWorkerProtocol, networkWorker: NetworkWorkerProtocol, jsonWorker: JSONDecoderWorkerProtocol) {
        
        self.coreDataWorker = coreDataWorker
        self.networkWorker = networkWorker
        self.jsonWorker = jsonWorker
    }
}
