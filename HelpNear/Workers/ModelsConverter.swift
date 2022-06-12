//
//  ModelsConverter.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation
import CoreLocation


struct ModelsConverter{
    
    static func poiFromNetworkToModel(from models: [POINetworkModel]) -> [POIModel]{
        
        var result: [POIModel] = []
        
        for model in models {
            
            var location: CLLocationCoordinate2D? = nil
            if let latitude = model.latitude, let longitude = model.longitude {
                
                location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            }
            
            let ageLimit: POIModel.AgeLimit
            
            switch model.age ?? -1{
                
            case 18... :
                ageLimit = .adultOnly
            case 14... :
                ageLimit = .fourteenAndHigher
            default:
                ageLimit = .forAll
            }
            
            let poi = POIModel(id: model.id,
                               title: model.title,
                               description: model.body,
                               ageLimit: ageLimit,
                               age: model.age ?? -1,
                               location: location,
                               rewardAmount: model.rewardAmount,
                               dateCreated: model.dateCreated)
            
            result.append(poi)
        }
        
        return result
    }
    
    static func userFromNetworkToModel(from models: [UserNetworkModel]) -> [UserModel]{
        
        []
    }
}
