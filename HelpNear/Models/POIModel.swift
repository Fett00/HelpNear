//
//  POIModel.swift
//  HelpNear

import Foundation
import CoreLocation



//Point of interest модель данных
struct POIModel{
    
    enum AgeLimit{
        
        case forAll
        case adultOnly
        case fourteenAndHigher
    }
    
    enum EventType{
        
        case social
        case evently
        case culture
        case sport
        case patriotic
        case eco
        case donor
        case medic
        case publicSafety
        case mediaVolunteering
    }
    
    let id: String
    
    let title: String
    
    let description: String
    
    let ageLimit: AgeLimit
    
    let age: Int
    
    //let eventType: EventType
    
    let location: CLLocationCoordinate2D?
    
    let rewardAmount: Int?

    let dateCreated: String
    
    //let status: String?
    
    static func acceptToFilter(_ filter: EventCollectionFilterModel, _ poi: POIModel) -> Bool{
        
        var status = false
        
        if poi.rewardAmount == nil && filter.salary == .without{
            
            status = true
        }
        else if poi.rewardAmount != nil && (filter.salary == .with){
            
            status = true
        }
        else if filter.salary == .all{
            
            status = true
        }

        return status
    }
}
