//
//  FeedParser.swift
//  VKDemo
//
//  Created by Anton Krylov on 22/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct FeedItem {
    
}

protocol IFeedParser {
    func parse(feedResponse: FeedResponse) -> [FeedItem]
}

class FeedParser: IFeedParser {
    func parse(feedResponse: FeedResponse) -> [FeedItem] {
        return [FeedItem()]
    }
}
