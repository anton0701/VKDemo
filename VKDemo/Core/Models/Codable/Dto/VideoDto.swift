//
//  VideoDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct VideoDto: Codable {
    let id: Int
    let ownerId: Int
    let title: String
    let description: String
    let duration: Int
    let photo130: String
    let photo320: String
    let photo640: String?
    let photo800: String?
    let photo1280: String?
    let firstFrame130: String
    let firstFrame320: String
    let firstFrame640: String?
    let firstFrame800: String?
    let firstFrame1280: String?
    let date: Int
    let addingDate: Int
    let views: Int
    let comments: Int
    let player: String
    let platform: String?
    let canEdit: Bool
    let canAdd: Bool
    let isPrivate: Bool
    let accessKey: String
    let processing: Bool
    let live: Bool
    let upcoming: Bool
    let isFavorite: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId
        case title
        case description
        case duration
        case photo130 = "photo_130"
        case photo320 = "photo_320"
        case photo640 = "photo_640"
        case photo800 = "photo_800"
        case photo1280 = "photo_1280"
        case firstFrame130 = "first_frame_130"
        case firstFrame320 = "first_frame_320"
        case firstFrame640 = "first_frame_640"
        case firstFrame800 = "first_frame_800"
        case firstFrame1280 = "first_frame_1280"
        case date
        case addingDate = "adding_date"
        case views
        case comments
        case player
        case platform
        case canEdit = "can_edit"
        case canAdd = "can_add"
        case isPrivate = "is_private"
        case accessKey = "access_key"
        case processing
        case live
        case upcoming
        case isFavorite = "is_favorite"
    }
}
