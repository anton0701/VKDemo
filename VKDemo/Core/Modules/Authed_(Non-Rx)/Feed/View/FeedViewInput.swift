//
//  FeedViewInput.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

protocol FeedViewInput: AnyObject {
    func setup(feedItems: [FeedItem])
    func reloadFeed()
    func addNewsFeedItems(at indexPaths: [IndexPath])
}
