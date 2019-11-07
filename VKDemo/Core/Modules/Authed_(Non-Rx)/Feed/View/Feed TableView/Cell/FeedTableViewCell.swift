//
//  FeedTableViewCell.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit
import SkeletonView

protocol SocialButtonsDelegate: class {
    func didLike(feedItem: FeedItem, completion: @escaping ((FeedItem) -> Void))
    func didUnlike(feedItem: FeedItem, completion: @escaping ((FeedItem) -> Void))
}


class FeedTableViewCell: UITableViewCell {
    static let cellName: String = String(describing: FeedTableViewCell.self)
    
    @IBOutlet weak var sourceIconImageView: UIImageView!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var dateAddedLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var commentsButton: CommentsButton!
    @IBOutlet weak var repostsButton: RepostsButton!
    
    @IBOutlet weak var previewCollectionView: UICollectionView! {
        didSet {
            previewCollectionViewDataSource.collectionView = previewCollectionView
        }
    }
    private lazy var previewCollectionViewDataSource = { AttachmentsCollectionViewDataSource()
    }()
    
    private var cellModel: FeedCellModel?
    private weak var delegate: SocialButtonsDelegate?
    
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    func setup(feedCellModel: FeedCellModel, delegate: SocialButtonsDelegate? = nil) {
        self.cellModel = feedCellModel
        self.delegate = delegate
        
        let feedText = feedCellModel.feedItem.item.text
        let feedTextLength = feedText?.count ?? 0
        
        textView.text = feedText
        sourceNameLabel.text = feedCellModel.sourceName
        dateAddedLabel.text = "Date added"
        
        let likesCount = feedCellModel.likes?.count ?? 0
        let userLiked = (feedCellModel.likes?.userLikes == BoolInt.true) ? true : false
        let commentsCount = feedCellModel.comments?.count ?? 0
        let repostsCount = feedCellModel.reposts?.count ?? 0
        
        likeButton.setup(likesCount: likesCount,
                         state: userLiked ? .liked : .notLiked,
                         animated: false,
                         delegate: self)
        commentsButton.setup(commentsCount: commentsCount)
        repostsButton.setup(repliesCount: repostsCount)
        
        
        feedCellModel.sourceIconUrl.getAsyncImageFromUrl { [weak self] image, url in
            guard let strongSelf = self,
                let cellModel = strongSelf.cellModel,
                cellModel.sourceIconUrl == url,
                let image = image,
                let strongImageView = strongSelf.sourceIconImageView  else {
                    return
            }
            
            UIView.transition(with: strongImageView,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {
                                strongImageView.image = image
            }, completion: nil)
        }
        
        if feedTextLength > 0 {
            let fixedWidth = textView.frame.size.width
            let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
            textViewHeightConstraint.constant = newSize.height
        } else {
            textViewHeightConstraint.constant = 0.0
        }
        
        collectionViewHeightConstraint.constant = previewCollectionViewDataSource.collectionViewHeight(for: cellModel?.feedItem.item.attachments ?? [AttachmentDto]())
        previewCollectionViewDataSource.setup(attachments: cellModel?.feedItem.item.attachments ?? [])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        hideSkeleton()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        // If the cell's size has to be exactly the content
        // Size of the collection View, just return the
        // collectionViewLayout's collectionViewContentSize.
        let cellHeight = previewCollectionViewDataSource.collectionViewHeight(for: cellModel?.feedItem.item.attachments ?? []) + 314.0
        let cellWidth = targetSize.width
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    func showSkeleton() {
        textView.showAnimatedGradientSkeleton()
        sourceIconImageView.showAnimatedGradientSkeleton()
        sourceNameLabel.showAnimatedGradientSkeleton()
        dateAddedLabel.showAnimatedGradientSkeleton()
        likeButton.showAnimatedGradientSkeleton()
        commentsButton.showAnimatedGradientSkeleton()
        repostsButton.showAnimatedGradientSkeleton()
        previewCollectionView.showAnimatedGradientSkeleton()
    }
    
    func hideSkeleton() {
        textView.hideSkeleton()
        sourceIconImageView.hideSkeleton()
        sourceNameLabel.hideSkeleton()
        dateAddedLabel.hideSkeleton()
        likeButton.hideSkeleton()
        commentsButton.hideSkeleton()
        repostsButton.hideSkeleton()
        previewCollectionView.hideSkeleton()
    }
    
    func hideCollectionView() {
        collectionViewHeightConstraint.constant = 0.0
    }
}

class FeedTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        font = UIFont.systemFont(ofSize: 14.0)
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        font = UIFont.systemFont(ofSize: 14.0)
        isScrollEnabled = false
    }
}

extension FeedTableViewCell: LikeButtonDelegate {
    func didLike(likeButton: LikeButton?) {
        guard let feedItem = cellModel?.feedItem else { return }
        
        delegate?.didLike(feedItem: feedItem, completion: { [weak self] updatedFeedItem in
            guard self?.cellModel?.feedItem.item.postId == updatedFeedItem.item.postId else { return }
            self?.cellModel?.feedItem = updatedFeedItem
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                likeButton?.setup(likesCount: updatedFeedItem.item.likes?.count ?? 0,
                                  state: .liked,
                                  animated: true,
                                  delegate: self)
            }
        })
    }
    
    func didUnlike(likeButton: LikeButton?) {
        guard let feedItem = cellModel?.feedItem else { return }
        
        delegate?.didUnlike(feedItem: feedItem, completion: { [weak self] updatedFeedItem in
            guard self?.cellModel?.feedItem.item.sourceId == updatedFeedItem.item.sourceId else { return }
            self?.cellModel?.feedItem = updatedFeedItem
            
            likeButton?.setup(likesCount: updatedFeedItem.item.likes?.count ?? 0,
                              state: .notLiked,
                              animated: true,
                              delegate: self)
        })
    }
}
