//
//  GroupDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct GroupDto: Codable {
    let id: Int
    let name: String
    let screenName: String
    let accessType: GroupAccessType
    let deactivated: String?
    let isAdmin: BoolInt?
    let adminLevel: GroupAdminLevelType?
    let isMember: BoolInt?
    let isAdvertiser: BoolInt?
    let invitedBy: Int?
    let type: GroupType
    let photo50: String
    let photo100: String
    let photo200: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case screenName = "screen_name"
        case accessType = "is_closed"
        case deactivated
        case isAdmin = "is_admin"
        case adminLevel = "admin_level"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case invitedBy = "invited_by"
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
    
    enum GroupAccessType: Int, Codable {
        case open = 0
        case closed = 1
        case `private` = 2
    }
    
    enum GroupAdminLevelType: Int, Codable {
        case moderator
        case editor
        case admin
    }
    
    enum GroupType: String, Codable {
        case group
        case page
        case event
    }
}
