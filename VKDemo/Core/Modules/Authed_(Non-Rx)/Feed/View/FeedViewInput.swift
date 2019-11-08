//
//  FeedViewInput.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

protocol FeedViewInput: AnyObject {
    func setup(feedItems: [FeedItem])
    func addNewFeedItems(feedItems: [FeedItem])
    func updateFeedAfterLike(feedItem: FeedItem)
}
