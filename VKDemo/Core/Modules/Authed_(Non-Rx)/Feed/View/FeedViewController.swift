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
        
        if let output = presenter {
            dataSource.output = output
        }
        
        presenter?.viewLoaded()
    }
    
    private func setupAppearance() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FeedViewController: FeedViewInput {
    func setup(feedItems: [FeedItem]) {
        dataSource.setup(with: feedItems)
    }
    
    func reloadFeed() {
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    func addNewsFeedItems(at indexPaths: [IndexPath]) {
        
    }
}

extension FeedViewController: UITableViewDelegate {
    
}
