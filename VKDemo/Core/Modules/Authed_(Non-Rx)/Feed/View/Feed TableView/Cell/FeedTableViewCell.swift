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
    
    @IBOutlet weak var previewCollectionView: UICollectionView!
    var previewCollectionViewDataSource = AttachmentsCollectionViewDataSource() {
        didSet {
            previewCollectionViewDataSource.collectionView = previewCollectionView
        }
    }
    
    private var cellModel: FeedCellModel?
    
    
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()        
    }
}
