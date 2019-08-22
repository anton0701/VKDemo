//
//  UserDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct UserDto: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let isClosed: Bool
    let canAccessClosed: Bool
    let sex: Sex
    let screenName: String
    let photo50: String
    let photo100: String
    let online: BoolInt
    
    enum Sex: Int, Codable {
        case unknown = 0
        case male
        case female
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case sex
        case screenName = "screen_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case online
    }
}
