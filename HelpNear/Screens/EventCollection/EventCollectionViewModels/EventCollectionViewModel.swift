//
//  EventCollectionDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 10.06.2022.
//

import Foundation

protocol EventCollectionViewModelProtocol{
    
    func requestEvents(handler: @escaping ()->())
    
    func getCurrentFilters() -> EventCollectionFilterModel
    
    func updateFilters(newFilter: EventCollectionFilterModel, handler: @escaping ()->())
    
    var data: [EventCollectionModel] { get }
}

class EventCollectionViewModel: EventCollectionViewModelProtocol{
    
    private(set) var data: [EventCollectionModel] = []
    
    private var filter = EventCollectionFilterModel.init(format: .all, startDate: nil, endDate: nil, difficult: .all, salary: .all, howFast: .all)
    
    private let dataWorker: EventsDataWorkerProtocol!
    
    init(dataWorker: EventsDataWorkerProtocol) {
        
        self.dataWorker = dataWorker
    }
    
    func requestEvents(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.dataWorker.requestEvents { models in
                
                self.data = []
                
                var filtredModels: [POIModel] = []
                
                filtredModels = models.filter{
                    
                    POIModel.acceptToFilter(self.filter, $0)
                }
                
                for model in filtredModels {

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
    
    func updateFilters(newFilter: EventCollectionFilterModel, handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.filter = newFilter
            handler()
        }
    }
    
    func getCurrentFilters() -> EventCollectionFilterModel{
        return self.filter
    }
}
