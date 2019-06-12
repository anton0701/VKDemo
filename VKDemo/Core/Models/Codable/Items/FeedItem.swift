//
//  FeedItem.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

enum FeedType: String, Codable {
    case post = "post"
    case photo = "photo"
    case photoTag = "photo_tag"
    case wallPhoto = "wall_photo"
    case friend = "friend"
    case note = "note"
    case audio = "audio"
    case video = "video"
}
struct FeedAttachment: Codable {
    
}
struct FeedPostSource: Codable {
    
}
struct Comment: Codable {
    
}
struct Like: Codable {
    
}
struct Repost: Codable {
    
}
struct View: Codable {
    
}
struct Photo: Codable {
    
}
struct Friend: Codable {
    
}
struct CopyHistory: Codable {
    
}
struct Video: Codable {
    
}

struct FeedItem: Codable {
    let type: FeedType
    let sourceId: Int
    let date: Date
    let postType: String? // TODO: enum
    let text: String?
    let markedAsAds: Bool?
    let attachments: [FeedAttachment]
    let postSource: [FeedPostSource]?
    let comments: [Comment]
    let likes: [Like]
    let reposts: [Repost]
    let views: [View]
    let isFavorite: Bool?
    let postId: Int?
    let photos: [Photo]
    let friends: [Friend]
    let signerId: Int?
    let video: Video
    let copyHistory: [CopyHistory]?
    
    private enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case text = "text"
        case postType = "post_type"
        case markedAsAds = "marked_as_ads"
        case postSource = "post_source"
        case isFavorite = "is_favorite"
        case postId = "post_id"
        case signerId = "signer_id"
        case copyHistory = "copy_history"

        case type = "type"
        case date = "date"
        case attachments = "attachments"
        case comments = "comments"
        case likes = "likes"
        case reposts = "reposts"
        case views = "views"
        case photos = "photos"
        case friends = "friends"
        case video = "video"
    }
}
