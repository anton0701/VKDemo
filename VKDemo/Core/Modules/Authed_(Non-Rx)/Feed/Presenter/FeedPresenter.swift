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
    
    init(view: FeedViewInput,
         router: FeedRouterInput,
         feedManager: IFeedManager) {
        self.view = view
        self.router = router
        self.feedManager = feedManager
    }
    
    private func getFeedAndSetupView() {
        
//        view?.showIsLoadingView(true) //
                
        feedManager.getFeed(count: 100, startFrom: nil, success: { [weak self] feedItems in
            guard let strongSelf = self else {
                return
            }
            strongSelf.feedItems = feedItems
            strongSelf.view?.setup(feedItems: feedItems)
        }) { error in
            print("BEGIN FEED ERRROR!\n\n\n")
            print(error)
            print("\n\n\nEND FEED ERRROR!")
        }
    }
    
    private func loadFeed(take: Int,
                     startFrom: Int?,
                    completion: (() -> Void)? = nil) {
        feedManager.getFeed(count: take, startFrom: startFrom, success: { [weak self] feedItems in
            let isDownloadingFromBeginning = (startFrom == nil)
            if isDownloadingFromBeginning {
                self?.feedItems = feedItems
                self?.view?.reloadFeed()
            } else {
                self?.feedItems += feedItems
                
                let startIndex = self?.feedItems.count ?? 0
                let endIndex = feedItems.count + startIndex
                let indexPaths = Array(startIndex...endIndex).map { IndexPath(row: $0, section: 0) }
                self?.view?.addNewsFeedItems(at: indexPaths)
                
                completion?()
            }
        }) { [weak self] error in
            completion?()
        }
    }

}

extension FeedPresenter: FeedViewOutput {
    func didRefresh() {
        getFeedAndSetupView()
    }
    
    func viewLoaded() {
        getFeedAndSetupView()
    }
}
