//
//  FeedPresenter.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

class FeedPresenter {
    private weak var view: FeedViewInput?
    private let router: FeedRouterInput
    
    private let feedManager: IFeedManager

    init(view: FeedViewInput,
         router: FeedRouterInput,
         feedManager: IFeedManager) {
        self.view = view
        self.router = router
        self.feedManager = feedManager
    }
}

extension FeedPresenter: FeedViewOutput {
    func viewLoaded() {
        feedManager.getFeed(success: { result in
            print(result)
        }) { error in
            print(error)
        }
    }
}
