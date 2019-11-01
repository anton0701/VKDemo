//
//  FeedTableViewCell.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

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
    
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    func setup(feedCellModel: FeedCellModel) {
        self.cellModel = feedCellModel
        
        let feedText = feedCellModel.feedItem.item.text
        let feedTextLength = feedText?.count ?? 0
        
        textView.text = feedText
        sourceNameLabel.text = feedCellModel.sourceName
        dateAddedLabel.text = "Date added"
        
        let likesCount = feedCellModel.likes?.count ?? 0
        let commentsCount = feedCellModel.comments?.count ?? 0
        let repostsCount = feedCellModel.reposts?.count ?? 0
        
        likeButton.setup(likesCount: likesCount, state: .notLiked, animated: false)
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
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {

        // If the cell's size has to be exactly the content
        // Size of the collection View, just return the
        // collectionViewLayout's collectionViewContentSize.
        let cellHeight = previewCollectionViewDataSource.collectionViewHeight(for: cellModel?.feedItem.item.attachments ?? []) + 314.0
        let cellWidth = targetSize.width
        
        return CGSize(width: cellWidth, height: cellHeight)
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
