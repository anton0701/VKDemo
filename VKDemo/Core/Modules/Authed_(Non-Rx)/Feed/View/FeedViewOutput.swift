//
//  FeedViewOutput.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

protocol FeedViewOutput: class {
    func viewLoaded()
    func didRefresh()
    func didScrollForMore()
    
//    func didLike(feedItem: FeedItem)
//    func didUnlike(feedItem: FeedItem)
}
