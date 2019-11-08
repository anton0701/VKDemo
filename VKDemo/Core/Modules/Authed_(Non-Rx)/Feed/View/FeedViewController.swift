//
//  FeedViewController.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

class FeedViewController: BaseViewController, ViperModuleTransitionHandler {
    var presenter: FeedViewOutput?
    
    @IBOutlet var dataSource: FeedTableViewDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        
        if let output = presenter as? (FeedViewOutput & SocialButtonsDelegate){
            dataSource.output = output
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.presenter?.viewLoaded()
        }
    }
    
    private func setupAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FeedViewController: FeedViewInput {
    func setup(feedItems: [FeedItem]) {
        dataSource.setup(with: feedItems)
    }
        
    func addNewFeedItems(feedItems: [FeedItem]) {
        dataSource.addNew(feedItems: feedItems)
    }
    
    func updateFeedAfterLike(feedItem: FeedItem) {
        dataSource.updateFeedItem(feedItem: feedItem)
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
