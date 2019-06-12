//
//  IFeedManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 05/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol IFeedManager {
    func getFeed(success: @escaping (FeedResponse) -> Void,
                 failure: @escaping FailureClosure)
}
