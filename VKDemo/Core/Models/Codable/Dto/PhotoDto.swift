//
//  PhotoDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct PhotoDto: Codable {
    let id: Int
    let albumId: Int
    let ownerId: Int
    let userId: Int?
    let text: String
    let date: Int
    let sizes: [PhotoSizeCopy]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case ownerId = "owner_id"
        case userId = "user_id"
        case text
        case date
        case sizes
    }
}

struct PhotoSizeCopy: Codable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct PhotosListDto: Codable {
    let count: Int
    let items: [ExtendedPhotoDto]
}

struct ExtendedPhotoDto: Codable {
    let id: Int
    let albumId: Int
    let ownerId: Int
    let userId: Int?
    let text: String
    let date: Int
    let sizes: [PhotoSizeCopy]
    let accessKey: String
    let likes: LikesCountDto
    let reposts: RepostCountDto
    let comments: CommentsCountDto
    let canComment: BoolInt
    let canRepost: BoolInt
    
    private enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case ownerId = "owner_id"
        case userId = "user_id"
        case text
        case date
        case sizes
        case accessKey = "access_key"
        case likes
        case reposts
        case comments
        case canComment = "can_comment"
        case canRepost = "can_repost"
    }
}
