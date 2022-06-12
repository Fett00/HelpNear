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
                
                self.data = []
                
                for user in users {
                    
                    self.data.append(RankingModel(name: user.name, score: String(user.score)))
                }
                
                self.data.sort { $0.score > $1.score }
                handler()
            }
        }
    }
}
