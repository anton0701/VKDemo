//
//  FeedItemCellViewModel.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct FeedCellModel {
    let sourceIconUrl: String?
    let sourceName: String?
    let dateAdded: Date?
    
    var feedItem: FeedItem
    
    
    init(feedItem: FeedItem) {
        self.feedItem = feedItem
        
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
    }
}
