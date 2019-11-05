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

extension FeedManager: IFeedManager {
    func getFeed(count: Int,
             startFrom: String?,
               success: @escaping ([FeedItem], String) -> Void,
               failure: @escaping FailureClosure) {
        _ = feedProvider.request(.getFeed(count: 10, startFrom: startFrom),
                                 success: { (feedResponse: FeedResponse) in
            let feedItems = self.feedParser.parse(feedResponse: feedResponse)
            success(feedItems, feedResponse.nextFrom)
        }, failure: { error in
            failure(error)
        })
    }
}
