//
//  AttachmentsCollectionViewDataSource.swift
//  VKDemo
//
//  Created by Anton Krylov on 25/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class AttachmentsCollectionViewDataSource: NSObject {
    
    weak var output: FeedViewOutput?
    var attachments: [AttachmentDto]?
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet {
            initialSetup()
        }
    }
    
    func setup(attachments: [AttachmentDto]) {
        self.attachments = attachments
        collectionView.reloadData()
    }
}

// MARK: - Private functions
extension AttachmentsCollectionViewDataSource {
    private func initialSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDelegate
extension AttachmentsCollectionViewDataSource: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension AttachmentsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attachments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
