//
//  PodcastDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct PodcastDto: Codable {
    let artist: String
    let id: Int
    let ownerId: Int
    let title: String
    let duration: Int
    let trackCode: String
    let url: String
    let date: Int
    let lyricsId: Int
    let noSearch: BoolInt
    let isExplicit: BoolInt
    let podcastInfo: PodcastInfoDto
    
    
    private enum CodingKeys: String, CodingKey {
        case artist
        case id
        case ownerId = "owner_id"
        case title
        case duration
        case trackCode = "track_code"
        case url
        case date
        case lyricsId = "lyrics_id"
        case noSearch = "no_search"
        case isExplicit = "is_explicit"
        case podcastInfo = "podcast_info"
    }
}

struct PodcastInfoDto: Codable {
    let cover: PodcastInfoCoverDto
    let plays: Int
    let isFavorite: Bool
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case cover
        case plays
        case isFavorite = "is_favorite"
        case description
    }
}

struct PodcastInfoCoverDto: Codable {
    let sizes: [PhotoSizeCopy]
}
