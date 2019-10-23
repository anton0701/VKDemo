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
    
    @IBOutlet weak var previewCollectionView: UICollectionView! {
        didSet {
            previewCollectionViewDataSource.collectionView = previewCollectionView
        }
    }
    private lazy var previewCollectionViewDataSource = { AttachmentsCollectionViewDataSource()
    }()
    
    private var cellModel: FeedCellModel?
    
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    func setup(feedCellModel: FeedCellModel) {
        self.cellModel = feedCellModel
        
        textView.text = feedCellModel.feedItem.item.text
        sourceNameLabel.text = feedCellModel.sourceName
        dateAddedLabel.text = "Date added"
        
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
        
        previewCollectionViewDataSource.setup(attachments: cellModel?.feedItem.item.attachments ?? [])
        
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)

        
        textViewHeightConstraint.constant = newSize.height
        textView.setNeedsLayout()
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
