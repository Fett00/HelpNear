//
//  POIModel.swift
//  HelpNear

import Foundation
import CoreLocation



//Point of interest
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
    
    let title: String
    
    let description: String
    
    let ageLimit: AgeLimit
    
    let eventType: EventType
    
    let location: CLLocationCoordinate2D
}
