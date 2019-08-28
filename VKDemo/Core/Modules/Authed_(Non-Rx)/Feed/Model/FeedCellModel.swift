//
//  FeedItemCellViewModel.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct FeedCellModel {
    let sourceIconUrl: String
    let sourceName: String
    let dateAdded: Date
        
    let photos: [PhotoDto]
    let videos: [VideoDto]
    let audios: [AudioDto]
    let docs: [DocDto]
    let links: [LinkDto]
    let notes: [NoteDto]
    let polls: [PollDto]
    let wikiPages: [WikiPageDto]
    let marketItems: [MarketItem]
    let marketAlbums: [MarketAlbum]
    let stickers: [Sticker]
    let podcasts: [PodcastDto]
        
    var feedItem: FeedItem
    
    // Для большой картинки подходят:
    // w, z, y, x, m, s
    // Для превью картинки, если картинка 1:
    // w, z, y, x, m, s
    
    init(feedItem: FeedItem) {
        self.feedItem = feedItem
        
        // Для шапки: sourceName, sourceIconUrl
        // dateAdded
        if feedItem.item.sourceId > 0 {
            // Post napisan user'om
            guard let sourceUserDto = feedItem.profiles?
                .filter({ $0.id == feedItem.item.sourceId })
                .first else {
                    fatalError("No source user found!")
            }
            sourceName = "\(sourceUserDto.lastName) \(sourceUserDto.firstName)"
            sourceIconUrl = sourceUserDto.photo100
        } else {
            // Post napisan group'oy
            let sourceGroupId = -1 * feedItem.item.sourceId
            guard let sourceGroupDto = feedItem.groups?
                .filter({ $0.id == sourceGroupId })
                .first else {
                    fatalError("No source user found!")
            }
            sourceName = sourceGroupDto.name
            sourceIconUrl = sourceGroupDto.photo100
        }
        
        dateAdded = feedItem.item.date
        // ************************* //
        
        // Attachments //
        self.photos = feedItem.item.attachments?.compactMap({ $0.photo }) ?? [PhotoDto]()
        self.videos = feedItem.item.attachments?.compactMap({ $0.video }) ?? [VideoDto]()
        self.audios = feedItem.item.attachments?.compactMap({ $0.audio }) ?? [AudioDto]()
        self.docs = feedItem.item.attachments?.compactMap({ $0.doc }) ?? [DocDto]()
        self.links = feedItem.item.attachments?.compactMap({ $0.link }) ?? [LinkDto]()
        self.notes = feedItem.item.attachments?.compactMap({ $0.note }) ?? [NoteDto]()
        self.polls = feedItem.item.attachments?.compactMap({ $0.poll }) ?? [PollDto]()
        self.wikiPages = feedItem.item.attachments?.compactMap({ $0.wikiPage }) ?? [WikiPageDto]()
        self.marketItems = feedItem.item.attachments?.compactMap({ $0.marketItem }) ?? [MarketItem]()
        self.marketAlbums = feedItem.item.attachments?.compactMap({ $0.marketAlbum }) ?? [MarketAlbum]()
        self.stickers = feedItem.item.attachments?.compactMap({ $0.sticker }) ?? [Sticker]()
        self.podcasts = feedItem.item.attachments?.compactMap({ $0.podcast }) ?? [PodcastDto]()
        // ****************** //
        
        // Likes, shares, views and info for these buttons
        // Mojno vzat' iz feedItem, mojno perenesti yavno
        // TODO: podumat'!
        // ****************** //
    }
}
