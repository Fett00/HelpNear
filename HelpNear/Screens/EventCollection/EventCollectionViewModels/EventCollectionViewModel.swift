//
//  EventCollectionDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 10.06.2022.
//

import Foundation

protocol EventCollectionViewModelProtocol{
    
    func requestEvents(handler: @escaping ()->())
    
    var data: [POIModel] { get }
}

class EventCollectionViewModel: EventCollectionViewModelProtocol{
    
    private(set) var data: [POIModel] = []
    
    private let dataWorker: EventsDataWorkerProtocol!
    
    init(dataWorker: EventsDataWorkerProtocol) {
        
        self.dataWorker = dataWorker
    }
    
    func requestEvents(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            handler()
        }
    }
}
