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

enum FeedAttachmentType: String, Codable {
    case photo = "photo"
    case video = "video"
    case audio = "audio"
    case doc = "doc"
    case link = "link"
    case note = "note"
    case poll = "poll"
    case page = "page"
    case album = "album"
    case photosList = "photos_list"
    case market = "market"
    case marketAlbum = "market_album"
    case prettyCards = "pretty_cards"
}

struct FeedAttachment: Codable {
    let type: FeedAttachmentType
    
    let photo: Photo?
    let video: Video?
    let audio: Audio?
    let doc: Doc?
    let link: Link?
    let note: Note?
    let poll: Poll?
    let wikiPage: WikiPage?
    let maketItem: MarketItem?
    let maketAlbum: MarketAlbum?
    let sticker: Sticker
    
//    case album = "album" TODO:доделать
//    case photosList = "photos_list" Массив из строк, содержащих идентификаторы фотографий
}

struct AlbumFeedAttachment: FeedAttachment {
    let type: FeedAttachmentType
    let id: Int
    let thumb: Photo
    let ownerId: Int
    let title: String
    let description: String
    let created: Int
    let updated: Int
    let size: Int
    
    private enum CodingKeys: String, CodingKey {
        case type
        case id
        case thumb
        case ownerId = "owner_id"
        case title
        case description
        case created
        case updated
        case size
    }
}


struct FeedPostSource: Codable {
    
}

struct Comment: Codable {
    
}

struct Like: Codable {
    
}

struct FeedRepostCount: Codable {
    let count: Int
    let userReposted: Bool
    
    private enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

struct View: Codable {
    
}

struct Photo: Codable {
    let id: Int
    let albumId: Int
    let ownerId: Int
    let userId: Int
    let text: String
    let date: Int
    let sizes: [PhotoSizeCopy]
    let width: Int
    let height: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case albumId = "album_id"
        case ownerId = "owner_id"
        case userId = "user_id"
        case text
        case date
        case sizes
        case width
        case height
    }
}

struct PhotoSizeCopy: Codable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct Friend: Codable {
    
}

struct CopyHistory: Codable {
    
}

struct Video: Codable {
    
}

struct Audio: Codable {
    
}

struct Doc: Codable {
    
}

struct WikiPage: Codable {
    
}

struct Link: Codable {
    
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
    let reposts: FeedRepostCount
    let views: [View]
    let isFavorite: Bool?
    let postId: Int?
    let photos: [Photo]
    let friends: [Friend]
    let signerId: Int?
    let video: Video
    let copyHistory: [CopyHistory]?
    let copyOwnerId: Int?
    let copyPostId: Int?
    let copyPostDate: Date?
    let canEdit: Bool?
    let canDelete: Bool?
    
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
        case copyOwnerId = "copy_owner_id"
        case copyPostId = "copy_post_id"
        case copyPostDate = "copy_post_date"
        case canEdit = "can_edit"
        case canDelete = "can_delete"
    }
}
