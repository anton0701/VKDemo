//
//  FeedItemDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct FeedItemDto: Codable {
    let type: FeedType
    let sourceId: Int
    let date: Date
    let postId: Int?
    let postType: String? // TODO: enum
    let text: String?
    let markedAsAds: BoolInt?
    let attachments: [AttachmentDto]?
    let postSource: FeedPostSource?
    let comments: CommentsCountDto?
    var likes: LikesCountDto?
    let reposts: RepostCountDto?
    let views: ViewsCountDto?
    let isFavorite: Bool?
    let photos: PhotosListDto?
    let friends: FriendsDto?
    let signerId: Int?
    let video: VideoListDto?
    let copyHistory: [CopyHistory]? // Если есть, то это репост
    let copyOwnerId: Int?
    let copyPostId: Int?
    let copyPostDate: Date?
    let canEdit: Bool?
    let canDelete: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case text
        case postType = "post_type"
        case markedAsAds = "marked_as_ads"
        case postSource = "post_source"
        case isFavorite = "is_favorite"
        case postId = "post_id"
        case signerId = "signer_id"
        case copyHistory = "copy_history"
        
        case type
        case date
        case attachments
        case comments
        case likes
        case reposts
        case views
        case photos
        case friends
        case video
        case copyOwnerId = "copy_owner_id" //Не факт, что приходит вообще
        case copyPostId = "copy_post_id" //Не факт, что приходит вообще
        case copyPostDate = "copy_post_date" //Не факт, что приходит вообще
        case canEdit = "can_edit"
        case canDelete = "can_delete"
    }
}

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

struct FeedPostSource: Codable {
    let type: String
    let platform: String?
}

struct CommentsCountDto: Codable {
    let count: Int
    let canPost: BoolInt?
    let groupsCanPost: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
        case groupsCanPost = "groups_can_post"
    }
}

struct LikesCountDto: Codable {
    var count: Int
    var userLikes: BoolInt
    let canLike: BoolInt?
    let canPublish: BoolInt?

    private enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
        case canLike = "can_like"
        case canPublish = "can_publish"
    }
}

struct RepostCountDto: Codable {
    let count: Int
    let userReposted: BoolInt
    
    private enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

struct ViewsCountDto: Codable {
    let count: Int
}

struct FriendsDto: Codable {
    let count: Int
    let items: [UserIdDto]
}

struct UserIdDto: Codable {
    let userId: Int
    
    private enum CodingKeys: String, CodingKey {
        case userId = "user_id"
    }
}

struct CopyHistory: Codable {
    let id: Int
    let ownerId: Int
    let fromId: Int
    let date: Date
    let postType: String? // TODO: enum
    let text: String
    let attachments: [AttachmentDto]?
    let postSource: FeedPostSource
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case fromId = "from_id"
        case date
        case postType = "post_type"
        case text
        case attachments
        case postSource = "post_source"
    }
}


struct MarketItem: Codable {
    
}

struct MarketAlbum: Codable {
    
}

struct Sticker: Codable {
    
}

struct Product: Codable {
    let price: Price
}

struct Price: Codable {
    let amount: Int
    let currency: Currency
    let text: String
}

struct Currency: Codable {
    let id: Int
    let name: String
}
