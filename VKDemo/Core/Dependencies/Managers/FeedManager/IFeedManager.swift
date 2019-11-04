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
                 startFrom: Int?,
                 success: @escaping ([FeedItem]) -> Void,
                 failure: @escaping FailureClosure)
}

extension IFeedManager {
    func getFeed(count: Int,
                 startFrom: Int? = nil,
                 success: @escaping ([FeedItem]) -> Void,
                 failure: @escaping FailureClosure) {
        getFeed(count: count,
                startFrom: nil,
                success: success,
                failure: failure)
    }
}
