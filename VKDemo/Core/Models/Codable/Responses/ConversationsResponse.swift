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
    let pinnedMessage: Bool?
    let state: String
    let photo: Bool?
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



