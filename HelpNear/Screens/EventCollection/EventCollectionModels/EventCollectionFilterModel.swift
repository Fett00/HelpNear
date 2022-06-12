//
//  EventCollectionFilter.swift
//  HelpNear
//
//  Created by Садык Мусаев on 12.06.2022.
//

import Foundation

struct EventCollectionFilterModel{
    
    enum Format: Int{
        
        case online
        case offline
        case all
    }
    
    enum Difficult: Int{
        
        case hard
        case easy
        case all
    }
    
    enum HowFast: Int{
        
        case soFast
        case weekFast
        case monthFast
        case all
    }
    
    enum Salary: Int{
        
        case with
        case without
        case all
    }
    
    var format: Format
    var startDate: Date?
    var endDate: Date?
    var difficult: Difficult
    var salary: Salary
    var howFast: HowFast
}
