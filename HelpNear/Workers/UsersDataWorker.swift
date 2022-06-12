//
//  UsersDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation

protocol UsersDataWorkerProtocol{
    
    func requestUsers(handler: @escaping ()->())
}

class UsersDataWorker: UsersDataWorkerProtocol{
    
    func requestUsers(handler: @escaping ()->()){
        
        handler()
    }
}
