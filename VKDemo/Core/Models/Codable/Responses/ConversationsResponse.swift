//
//  ConversationsResponse.swift
//  VKDemo
//
//  Created by Anton Krylov on 01.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct ConversationsResponse: Codable {
    let count: Int
    let items: [ConversationDto]
}

struct ConversationDto: Codable {
    let peer: PeerDto
    let inRead: Int
    let outRead: Int
    let unread_count: Int
    let important: BoolInt
    let unanswered: BoolInt
    let push_settings: PushSettingsDto
    let can_write: CanWriteDto
    let chat_settings: ChatSettingsDto
        
}

struct PeerDto: Codable {
    let id: Int
    let type: String
    let localId: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case localId = "local_id"
    }
}

struct PushSettingsDto: Codable {
    let disabledUntil: Int
    let disabledForever: BoolInt
    let noSound: BoolInt
    
    private enum CodingKeys: String, CodingKey {
        case disabledUntil = "disabled_until"
        case disabledForever = "disabled_forever"
        case noSound = "no_sound"
    }
}

struct CanWriteDto: Codable {
    let allowed: BoolInt
    let reason: Int
}

struct ChatSettingsDto: Codable {
    let membersCount: Int
    let title: String
    let pinnedMessage: PinnedMessageDto
    let state: String
    let photo: ChatPhotoDto
    let activeIds: [Int]
    let isGroupChannel: BoolInt

    
    private enum CodingKeys: String, CodingKey {
        case membersCount = "members_count"
        case title
        case pinnedMessage = "pinned_message"
        case state
        case photo
        case activeIds = "active_ids"
        case isGroupChannel = "is_group_channel"
    }
}

struct PinnedMessageDto: Codable {
    let id: Int
    let date: Int
    let fromId: Int
    let text: String
    let attachments: String // TODO: Struct
    let geo: GeoDto
}

struct ChatPhotoDto: Codable {
    let photo50: String?
    let photo100: String?
    let photo200: String?
    
    private enum CodingKeys: String, CodingKey {
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

struct GeoDto: Codable {
    let type: String
    let coordinates: String
    let place: GeoPlaceDto
}

struct GeoPlaceDto: Codable {
    let id: Int
    let title: String
    let latitude: Double
    let longitude: Double
    let created: Int
    let iconUrl: String
    let country: String
    let city: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case latitude
        case longitude
        case created
        case iconUrl = "icon"
        case country
        case city
    }
}


