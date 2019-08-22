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
    
    init(feedProvider: MoyaProvider<FeedTarget>) {
        self.feedProvider = feedProvider
    }
}

extension FeedManager: IFeedManager {
    func getFeed(success: @escaping (FeedResponse) -> Void,
                 failure: @escaping FailureClosure) {
        _ = feedProvider.request(.getFeed, success: { (result: FeedResponse) in
            success(result)
        }) { error in
            failure(error)
        }
    }
}
