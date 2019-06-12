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
    let deactivated: String?
    let isClosed: Bool
    let canAccessClosed: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case deactivated
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
    }
}
