//
//  FeedResponse.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct Profile: Codable {
    
}

struct Group: Codable {
    
}

struct FeedResponse: Codable {
    let items: [FeedItem]
    let profiles: [Profile]?
    let groups: [Group]?
    let nextFrom: String
    
    private enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
        case nextFrom = "next_from"
    }
}
