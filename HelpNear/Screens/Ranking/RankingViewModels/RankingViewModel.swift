//
//  RankingViewModel.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation

protocol RankingViewModelProtocol{
    
    var data: [RankingModel] { get }
    
    func requestRankedUsers(handler: @escaping ()->())
}

final class RankingViewModel: RankingViewModelProtocol{
    
    private let usersDataWorker: UsersDataWorkerProtocol
    
    private(set) var data: [RankingModel] = []
    
    init(usersDataWorker: UsersDataWorkerProtocol){
        
        self.usersDataWorker = usersDataWorker
    }
    
    func requestRankedUsers(handler: @escaping ()->()){
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            self.usersDataWorker.requestUsers { users in 
                
                self.data = [
                
                    .init(name: "Егор", score: "1233"),
                        .init(name: "Петр", score: "13"),
                        .init(name: "Евгений", score: "99"),
                        .init(name: "Иван", score: "17"),
                        .init(name: "Светлана", score: "1233"),
                        .init(name: "Садык :3", score: "9999"),
                        .init(name: "Евгениус", score: "199"),
                        .init(name: "Иван", score: "17"),
                        .init(name: "Елена", score: "22")
                ]
                
                self.data.sort { $0.score > $1.score }
                handler()
            }
        }
    }
}
