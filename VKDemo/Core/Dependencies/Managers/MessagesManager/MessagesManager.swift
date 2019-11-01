//
//  MessagesManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 01.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya

class MessagesManager {
    private let feedProvider: MoyaProvider<MessagesTarget>
    private let feedParser: IFeedParser
    
    init(feedProvider: MoyaProvider<FeedTarget>,
         feedParser: IFeedParser) {
        self.feedProvider = feedProvider
        self.feedParser = feedParser
    }
}

extension MessagesManager: IMessagesManager {
    func getFeed(success: @escaping ([FeedItem]) -> Void,
                 failure: @escaping FailureClosure) {
        _ = feedProvider.request(.getFeed, success: { (feedResponse: FeedResponse) in
            let feedItems = self.feedParser.parse(feedResponse: feedResponse)
            success(feedItems)
        }) { error in
            failure(error)
        }
    }
    
    func getConversations(success: @escaping (Dictionary<String, Any>) -> Void,
                          failure: @escaping FailureClosure) {
        _ = feedProvider.request(.getFeed, success: { (feedResponse: FeedResponse) in
//            let feedItems = self.feedParser.parse(feedResponse: feedResponse)
//            success(feedResponse.)
        }) { error in
            failure(error)
        }
    }
}
