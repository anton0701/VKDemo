//
//  IFeedManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 05/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol IFeedManager {
    func getFeed(count: Int,
                 startFrom: String?,
                 success: @escaping ([FeedItem], String) -> Void,
                 failure: @escaping FailureClosure)
    
    func addLike(for feedItem: FeedItem,
                 success: @escaping (FeedItem) -> Void,
                 failure: @escaping FailureClosure)
    
    func deleteLike(from feedItem: FeedItem,
                    success: @escaping (FeedItem) -> Void,
                    failure: @escaping FailureClosure)
    
    func add(feedLikeUpdateHandler: @escaping (_ feedItem: FeedItem) -> Void)
}

extension IFeedManager {
    func getFeed(count: Int,
                 startFrom: String? = nil,
                 success: @escaping ([FeedItem], String) -> Void,
                 failure: @escaping FailureClosure) {
        getFeed(count: count,
                startFrom: nil,
                success: success,
                failure: failure)
    }
}
