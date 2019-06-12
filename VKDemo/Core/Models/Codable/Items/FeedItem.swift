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

enum BoolInt: Codable, Int {
    case `true` = 1
    case `false` = 0
}

extension BoolInt {
    func asBool() -> Bool {
        return self == .true
    }
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
    
    private enum CodingKeys: String, CodingKey {
        case type
        case photo
        case video
        case audio
        case doc
        case link
        case note
        case poll
        case wikiPage = "page"
        case maketItem
        case maketAlbum
        case sticker
    }
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

struct Audio: Codable {
    let id: Int
    let ownerId: Int
    let artist: Int
    let title: Int
    let duration: Int
    let url: Int
    let lyricsId: Int
    let albumId: Int
    let genreId: Int
    let date: Int
    let noSearch: Int?
    let isHq: Bool
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case artist
        case title
        case duration
        case url
        case lyricsId = "lyrics_id"
        case albumId = "album_id"
        case genreId = "genre_id"
        case date
        case noSearch = "no_search"
        case isHq = "is_hq"
    }
}

struct Doc: Codable {
    let id: Int
    let ownerId: Int
    let title: String
    let size: Int
    let ext: String
    let url: Int
    let date: Int
    let type: Int
    let preview: DocPreview
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case title
        case size
        case ext
        case url
        case date
        case type
        case preview
    }
}

struct DocPreview: Codable {
    let photo: PreviewPhoto?
    let audioMessage: PreviewAudio?
    
    private enum CodingKeys: String, CodingKey {
        case photo
        case audioMessage = "audio_message"
    }
}

struct PreviewPhoto: Codable {
    // Возмлжно не PhotoSizeCopy, а другой класс, тк вроде юзается src вместо url
    let sizes: [PhotoSizeCopy]
}

struct PreviewAudio: Codable {
    let duration: Int
    let waveform: [Int]
    let linkOgg: String
    let linkMp3: String
    
    private enum CodingKeys: String, CodingKey {
        case duration
        case waveform
        case linkOgg = "link_ogg"
        case linkMp3 = "link_mp3"
    }
}

struct WikiPage: Codable {
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

struct Link: Codable {
    let urlString: String
    let title: String
    let caption: String
    let description: String
    let photo: Photo?
    let product: Product?
    let button: ButtonDto?
    let previewPage: String
    let previewUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case urlString = "url"
        case title
        case caption
        case description
        case photo
        case product
        case button
        case previewPage = "preview_page"
        case previewUrl = "preview_url"
    }
}

struct Note: Codable {
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

struct Poll: Codable {
    let id: Int
    let ownerId: Int
    let created: Int
    let question: String
    let votesCount: Int
    let answers: [PossibleAnswer]
    let isAnonymous: Bool
    let isMultiple: Bool
    let answerIds: [Int]
    let endDate: Int
    let isClosed: Bool
    let isBoard: Bool
    let canEdit: Bool
    let canVote: Bool
    let canReport: Bool
    let canShare: Bool
    let authorId: Int
    let photo: Photo
    let background: Int
    let friends: [Int]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case created
        case question
        case votesCount = "votes"
        case answers
        case isAnonymous = "anonymous"
        case isMultiple = "multiple"
        case answerIds = "answer_ids"
        case endDate = "end_date"
        case isClosed = "closed"
        case isBoard = "is_board"
        case canEdit = "can_edit"
        case canVote = "can_vote"
        case canReport = "can_report"
        case canShare = "can_share"
        case authorId = "author_id"
        case photo
        case background
        case friends
    }
}

struct PossibleAnswer: Codable {
    let id: Int
    let text: String
    let votes: Int
    let rate: Double
}

struct PollBackground: Codable {
    let id: Int
    let type: PollBackgroundType
    let angle: Int?
    let color: String
    let width: Int?
    let height: Int?
    let images: [Photo]?
    let points: [PollBackgroundPoint]?
    
    enum PollBackgroundType: String, Codable {
        case gradient = "gradient"
        case tile = "tile"
    }
    
    struct PollBackgroundPoint: Codable {
        let position: Double
        let color: String
    }
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

struct ButtonDto: Codable {
    let title: String
    let action: ButtonActionDto
}

struct ButtonActionDto: Codable {
    let title: String
    let urlString: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case urlString = "url"
    }
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
