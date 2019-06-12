//
//  AttachmentDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct AttachmentDto: Codable {
    let type: AttachmentType
    
    let photo: PhotoDto?
    let video: VideoDto?
    let audio: AudioDto?
    let doc: DocDto?
    let link: LinkDto?
    let note: NoteDto?
    let poll: PollDto?
    let wikiPage: WikiPageDto?
    let maketItem: MarketItem?
    let maketAlbum: MarketAlbum?
    let sticker: Sticker?
    
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

enum AttachmentType: String, Codable {
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
