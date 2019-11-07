//
//  FeedManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 05/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya

class FeedManager {
    private let feedProvider: MoyaProvider<FeedTarget>
    private let feedParser: IFeedParser
    
    init(feedProvider: MoyaProvider<FeedTarget>,
         feedParser: IFeedParser) {
        self.feedProvider = feedProvider
        self.feedParser = feedParser
    }
}

// TODO: перенести
struct LikesCountResponse: Codable {
    let likes: Int
}

extension FeedManager: IFeedManager {
    func addLike(for feedItem: FeedItem, success: @escaping (FeedItem, Int) -> Void, failure: @escaping FailureClosure) {
        _ = feedProvider.request(.addLike(feedItem: feedItem), success: { (likesCountResponse: LikesCountResponse) in
            print("adfadasd")
        }, failure: { error in
            print("123123adfadasd")
        })
    }
    
    func getFeed(count: Int,
             startFrom: String?,
               success: @escaping ([FeedItem], String) -> Void,
               failure: @escaping FailureClosure) {
        _ = feedProvider.request(.getFeed(count: count, startFrom: startFrom),
                                 success: { (feedResponse: FeedResponse) in
            let feedItems = self.feedParser.parse(feedResponse: feedResponse)
            success(feedItems, feedResponse.nextFrom)
        }, failure: { error in
            failure(error)
        })
    }
}
