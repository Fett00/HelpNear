//
//  POINetworkModel.swift
//  HelpNear
//
//  Created by Садык Мусаев on 11.06.2022.
//

import Foundation

struct POINetworkModel: Codable{
    
    let id: String
    let title: String
    let body: String
    let dateCreated: String
    let expires: String?
    let status: String?
    let creatorUserId: String?
    let candidatesId: String?
    let selectedCandidatesId: String?
    let rewardAmount: Int?
    let organizationId: String?
    let place: String?
    let type: String?
    //let reward: String?
    //let skills: String?
    let difficulty: Int?
    let participationType: String?
    //let roles: String?
    let age: Int?
    let longitude: Double?
    let latitude: Double?
}
