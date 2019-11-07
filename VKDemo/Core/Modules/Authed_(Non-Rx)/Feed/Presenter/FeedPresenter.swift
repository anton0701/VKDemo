//
//  FeedPresenter.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

class FeedPresenter {
    private weak var view: FeedViewInput?
    private let router: FeedRouterInput
    private let feedManager: IFeedManager
    
    var feedItems =  [FeedItem]()
    var nextFrom: String?
    
    init(view: FeedViewInput,
         router: FeedRouterInput,
         feedManager: IFeedManager) {
        self.view = view
        self.router = router
        self.feedManager = feedManager
    }
    
    private func loadFeed(take: Int,
                     startFrom: String?,
                    completion: (() -> Void)? = nil) {
        feedManager.getFeed(count: take, startFrom: startFrom, success: { [weak self] feedItems, nextFrom in
            self?.nextFrom = nextFrom
            
            let isDownloadingFromBeginning = (startFrom == nil)
            if isDownloadingFromBeginning {
                self?.feedItems = feedItems
                self?.view?.setup(feedItems: feedItems)
            } else {
                self?.feedItems += feedItems
                self?.view?.addNewFeedItems(feedItems: feedItems)
                completion?()
            }
        }) { [weak self] error in
            completion?()
        }
    }

    private func likeFeed(feedItem: FeedItem, completion: @escaping ((FeedItem) -> Void)) {
        feedManager.addLike(for: feedItem,
                            success: { [weak self] feedItem in
                                completion(feedItem)
        }) { [weak self] error in
            
        }
        
    }
    
    private func unlikeFeed(feedItem: FeedItem, completion: @escaping ((FeedItem) -> Void)) {
        feedManager.deleteLike(for: feedItem, success: { feedItem in
            completion(feedItem)
        }) { error in
            
        }
    }
}

extension FeedPresenter: FeedViewOutput {
    func didRefresh() {
        loadFeed(take: 15, startFrom: nil)
    }
    
    func viewLoaded() {
        loadFeed(take: 15, startFrom: nil, completion: nil)
    }
    
    func didScrollForMore() {
        loadFeed(take: 15, startFrom: nextFrom, completion: nil)
    }
}

extension FeedPresenter: SocialButtonsDelegate {
    func didLike(feedItem: FeedItem, completion: @escaping ((FeedItem) -> Void)) {
        likeFeed(feedItem: feedItem, completion: completion)
    }
    
    func didUnlike(feedItem: FeedItem, completion: @escaping ((FeedItem) -> Void)) {
        unlikeFeed(feedItem: feedItem, completion: completion)
    }
}
