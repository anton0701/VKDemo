//
//  FeedTableViewDataSource.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class FeedTableViewDataSource: NSObject {

    weak var output: FeedViewOutput?
    private let cellName = FeedTableViewCell.cellName
    private var feedCellModels = [FeedCellModel]()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            initialSetup()
        }
    }
    
    private lazy var templateFeedTextView: UITextView = {
        let textView = FeedTextView(frame: CGRect(x: 0.0,
                                                  y: 0.0,
                                                  width: tableView.frame.size.width - 32.0,
                                                  height: 0.0))
        return textView
    }()
    
    private func templateFeedTextViewHeight(text: String) -> Double {
        guard text.count > 0 else {
            return 0.0
        }
        templateFeedTextView.text = text
        let fixedWidth = templateFeedTextView.frame.size.width
        let textViewSize = templateFeedTextView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        return Double(textViewSize.height)
    }
    
    func setup(with feedItems: [FeedItem]) {
        feedCellModels = feedItems.map({ FeedCellModel(feedItem: $0) })
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
}

// MARK: - Private functions
extension FeedTableViewDataSource {
    private func initialSetup() {
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
                
        tableView.estimatedRowHeight = 300.0
        
        let refreshControl = UIRefreshControl(frame: .zero)
        refreshControl.addTarget(self,
                                 action: #selector(didPulledRefresh(_:)),
                                 for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func didPulledRefresh(_: UIRefreshControl) {
        output?.didRefresh()
    }
}

// MARK: - UITableViewDataSource
extension FeedTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        let feedCellModel = feedCellModels[indexPath.row]
        cell.setup(feedCellModel: feedCellModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let feedCellModel = feedCellModels[indexPath.row]
        
        let textViewHeight = templateFeedTextViewHeight(text: feedCellModel.feedItem.item.text ?? "")
        let collectionViewHeight = ceil(Double(feedCellModel.photos.count) / 2.0) * 125.0
        let headerViewHeight = 82.0
        let socialButtonsViewHeight = 44.0
        let sumMarginsHeight = 50.5 + 2.0 * 0.5
        
        let overallHeight = headerViewHeight +
                            textViewHeight +
                            collectionViewHeight +
                            socialButtonsViewHeight +
                            sumMarginsHeight
        
        return CGFloat(overallHeight)
    }
}

// MARK: - UITableViewDelegate
extension FeedTableViewDataSource: UITableViewDelegate {
    
}
