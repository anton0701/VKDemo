//
//  DocDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct DocDto: Codable {
    let id: Int
    let ownerId: Int
    let title: String
    let size: Int
    let ext: String
    let url: String
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
    let photo: DocPreviewPhoto?
    let audioMessage: DocPreviewAudio?
    let video: DocPreviewVideo?
    
    private enum CodingKeys: String, CodingKey {
        case photo
        case audioMessage = "audio_message"
        case video
    }
}

struct DocPreviewPhoto: Codable {
    let sizes: [DocPhotoSizeCopy]
}

struct DocPreviewVideo: Codable {
    let src: String
    let width: Int
    let height: Int
    let fileSize: Int
    
    private enum CodingKeys: String, CodingKey {
        case src
        case width
        case height
        case fileSize = "file_size"
    }
}

struct DocPhotoSizeCopy: Codable {
    let src: String
    let width: Int
    let height: Int
    let type: String
}

struct DocPreviewAudio: Codable {
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
