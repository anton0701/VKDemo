//
//  LinkDto.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct LinkDto: Codable {
    let urlString: String
    let title: String
    let caption: String
    let description: String
    let photo: PhotoDto?
    let product: Product?
    let button: ButtonDto?
    let previewPage: String?
    let previewUrl: String?
    
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

struct ButtonDto: Codable {
    let title: String
    let action: ButtonActionDto
}

struct ButtonActionDto: Codable {
    let type: String
    let urlString: String
    
    private enum CodingKeys: String, CodingKey {
        case type
        case urlString = "url"
    }
}
