//
//  FeedResponse.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct FeedResponse: Codable {
    let items: [FeedItemDto]
    let profiles: [UserDto]?
//    TODO:
//    Поле profiles содержит массив объектов пользователей (UserDto) с дополнительными полями:
//    photo — адрес фотографии пользователя размером 50x50px;
//    photo_medium_rec — адрес фотографии пользователя раз мером 100x100px;
//    screen_name — короткий адрес страницы пользователя (например, andrew или id6492).

    let groups: [GroupDto]?
    let nextFrom: String
    
    private enum CodingKeys: String, CodingKey {
        case items
        case profiles
        case groups
        case nextFrom = "next_from"
    }
}
