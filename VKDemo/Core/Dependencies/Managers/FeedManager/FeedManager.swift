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
    
    private let onFeedLikeUpdate = Events<FeedItem>()
    
    init(feedProvider: MoyaProvider<FeedTarget>,
         feedParser: IFeedParser) {
        self.feedProvider = feedProvider
        self.feedParser = feedParser
    }
}


extension FeedManager: IFeedManager {
    func addLike(for feedItem: FeedItem, success: @escaping (FeedItem) -> Void, failure: @escaping FailureClosure) {
        _ = feedProvider.request(.addLike(feedItem: feedItem), success: { [weak self, feedItem] (likesCountResponse: LikesCountResponse) in
            var feedItem = feedItem
            feedItem.item.likes?.count = likesCountResponse.likesCount
            feedItem.item.likes?.userLikes = BoolInt.true
            self?.onFeedLikeUpdate.raise(feedItem)
            success(feedItem)
        }, failure: { error in
            failure(error)
        })
    }
    
    func deleteLike(from feedItem: FeedItem,
                         success: @escaping (FeedItem) -> Void,
                         failure: @escaping FailureClosure) {
        _ = feedProvider.request(.deleteLike(feedItem: feedItem), success: { [weak self, feedItem] (likesCountResponse: LikesCountResponse) in
            var feedItem = feedItem
            feedItem.item.likes?.count = likesCountResponse.likesCount
            feedItem.item.likes?.userLikes = BoolInt.false
            self?.onFeedLikeUpdate.raise(feedItem)
            success(feedItem)
        }, failure: { error in
            failure(error)
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
    
    func add(feedLikeUpdateHandler: @escaping (_ feedItem: FeedItem) -> Void) {
        onFeedLikeUpdate.addHandler(feedLikeUpdateHandler)
    }
}
