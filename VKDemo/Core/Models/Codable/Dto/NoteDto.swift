//
//  NoteDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct NoteDto: Codable {
    let id: Int
    let ownerId: Int
    let title: String
    let text: String
    let date: Int
    let commentsCount: Int
    let readComments: Int?
    let viewUrlString: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case title
        case text
        case date
        case commentsCount = "comments"
        case readComments = "read_comments"
        case viewUrlString = "view_url"
    }
}
