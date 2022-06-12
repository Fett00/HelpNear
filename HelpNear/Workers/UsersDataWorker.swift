//
//  UsersDataWorker.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation

protocol UsersDataWorkerProtocol{
    
    func requestUsers(handler: @escaping (_ users: [UserModel])->())
}

class UsersDataWorker: UsersDataWorkerProtocol{
    
    private var users: [UserModel] = []
    
    private let networkWorker: NetworkWorkerProtocol
    private let jsonWorker: JSONDecoderWorkerProtocol
    
    init(networkWorker: NetworkWorkerProtocol, jsonWorker: JSONDecoderWorkerProtocol){
        
        self.networkWorker = networkWorker
        self.jsonWorker = jsonWorker
    }
    
    func requestUsers(handler: @escaping (_ users: [UserModel])->()){
        
        networkWorker.getData(from: URLs.usersURL) { result in
            
            switch result{
                
            case .failure(let error):
                print(error)
            case .success(let data):
                guard let networkModels = self.jsonWorker.decode(type: [UserNetworkModel].self, data: data) else { return }
                self.users = ModelsConverter.userFromNetworkToModel(from: networkModels)
            }
            handler(self.users)
        }
    }
}
