//
//  EventCollectionDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 10.06.2022.
//

import Foundation

protocol EventCollectionViewModelProtocol{
    
    func requestEvents(handler: @escaping ()->())
    
    var data: [EventCollectionModel] { get }
}

class EventCollectionViewModel: EventCollectionViewModelProtocol{
    
    private(set) var data: [EventCollectionModel] = []
    
    private let dataWorker: EventsDataWorkerProtocol!
    
    init(dataWorker: EventsDataWorkerProtocol) {
        
        self.dataWorker = dataWorker
    }
    
    func requestEvents(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.dataWorker.requestEvents { models in
                
                self.data = []
                
                for model in models {
                    
                    var salary = ""
                    
                    if let rewardAmount = model.rewardAmount{
                        salary = "\(rewardAmount)" + " ₽"
                    }
                    else {
                        salary = "Бесплатно"
                    }

                    let viewModel = EventCollectionModel(title: model.title,
                                                         description: model.description,
                                                         salary: salary)
                    self.data.append(viewModel)
                }
            }
            handler()
        }
    }
}
