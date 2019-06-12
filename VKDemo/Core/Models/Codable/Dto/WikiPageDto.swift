//
//  WikiPageDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct WikiPageDto: Codable {
    let id: Int
    let groupId: Int
    let creatorId: Int
    let title: String
    let currentUserCanEdit: BoolInt
    let currentUserCanEditAccess: BoolInt
    let readRights: WikiPageAccessRights
    let editRights: WikiPageAccessRights
    let edited: Int
    let created: Int
    let editorId: Int
    let viewsCount: Int
    let parent: String?
    let parent2: String?
    let source: String?
    let html: String?
    let viewUrlString: String
    
    enum WikiPageAccessRights: Int, Codable {
        case groupManagersOnly = 0
        case groupMembersOnly = 1
        case everybody = 2
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case groupId = "group_id"
        case creatorId = "creator_id"
        case title
        case currentUserCanEdit = "current_user_can_edit"
        case currentUserCanEditAccess = "current_user_can_edit_access"
        case readRights = "who_can_view"
        case editRights = "who_can_edit"
        case edited
        case created
        case editorId = "editor_id"
        case viewsCount = "views"
        case parent
        case parent2
        case source
        case html
        case viewUrlString = "view_url"
    }
}
