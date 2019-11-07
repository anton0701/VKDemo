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
    
    func addNew(feedItems: [FeedItem]) {
        let newFeedCellModels = feedItems.map({ FeedCellModel(feedItem: $0) })
        let startIndex = feedCellModels.count
        feedCellModels += newFeedCellModels
        let endIndex = feedCellModels.count - 1
        let newIndexPaths = Array(startIndex...endIndex).map { IndexPath(item: $0, section: 0)
        }
        tableView.insertRows(at: newIndexPaths, with: .none)
    }
}

// MARK: - Private functions
extension FeedTableViewDataSource {
    private func initialSetup() {
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        tableView.dataSource = self
        tableView.delegate = self
                
        tableView.estimatedRowHeight = 300.0
        tableView.tableFooterView = FeedLoadMoreFooterView.loadFromXib()
        
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

// MARK: - UITableViewDataSource, UITableViewDelegate
extension FeedTableViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard feedCellModels.count == 0,
            let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as? FeedTableViewCell else { return nil }

        cell.showSkeleton()
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard feedCellModels.count == 0 else { return CGFloat(0) }
        return CGFloat(300.0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (feedCellModels.count - 1) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                self.output?.didScrollForMore()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedCellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? FeedTableViewCell else {
            return UITableViewCell()
        }
        
        let feedCellModel = feedCellModels[indexPath.row]
        // TODO: output as! SocialButtonsDelegate переделать
        cell.setup(feedCellModel: feedCellModel, delegate: output as! SocialButtonsDelegate)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        82+169+44+52
        if indexPath.row >= feedCellModels.count { return 347.0 }
        
        let feedCellModel = feedCellModels[indexPath.row]
        let textViewHeight = templateFeedTextViewHeight(text: feedCellModel.feedItem.item.text ?? "")
        let collectionViewHeigh = collectionViewHeight(for: feedCellModel.feedItem.item.attachments ?? [AttachmentDto]())
//            ceil(Double(feedCellModel.photos.count) / 2.0) * 125.0 + 10
        
        let headerViewHeight = 82.0
        let socialButtonsViewHeight = 44.0
        let sumMarginsHeight = 50.5 + 2.0 * 0.5
        
        let overallHeight = headerViewHeight +
                            textViewHeight +
                            Double(collectionViewHeigh) +
                            socialButtonsViewHeight +
                            sumMarginsHeight
        
        return CGFloat(overallHeight)
    }
    
    func collectionViewHeight(for attachments: [AttachmentDto]) -> CGFloat {
        if (attachments.count == 1),
            let photo = attachments.first?.photo,
            photo.sizes.count > 0 {
            let photoSizes = photo.sizes
            let photoSizesOrderArray = ["z", "y", "x", "w"]
            let properPhotoSize = photoSizes.sorted(by: {
                guard let index0 = photoSizesOrderArray.index(of: $0.type) else { return false }
                guard let index1 = photoSizesOrderArray.index(of: $1.type) else { return true }
                return index0 <= index1
                }).first
            let width = tableView.frame.width - 32.0
            let height = CGFloat(properPhotoSize?.height ?? 0) / CGFloat(properPhotoSize?.width ?? 1) * width
            
            return height
        }
            
            
        let height = CGFloat(120.0)
        let photosCount = attachments.filter({
            $0.type == .photo
            }).count
        
        return ceil(CGFloat(photosCount) / 2.0) * height
    }

}
