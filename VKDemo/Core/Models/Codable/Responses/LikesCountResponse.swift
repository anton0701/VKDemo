//
//  LikesCountResponse.swift
//  VKDemo
//
//  Created by Anton Krylov on 07.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct LikesCountResponse: Codable {
    let likesCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case likesCount = "likes"
    }
}
