//
//  AudioDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct AudioDto: Codable {
    let id: Int
    let ownerId: Int
    let artist: String
    let title: String
    let duration: Int
    let urlString: String
    let lyricsId: Int?
    let albumId: Int?
    let genreId: Int?
    let date: Int
    let noSearch: Int?
    let isHq: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case artist
        case title
        case duration
        case urlString = "url"
        case lyricsId = "lyrics_id"
        case albumId = "album_id"
        case genreId = "genre_id"
        case date
        case noSearch = "no_search"
        case isHq = "is_hq"
    }
}
