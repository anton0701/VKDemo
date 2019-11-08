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
    
    weak var collectionView: UICollectionView!{
        didSet {
            initialSetup()
        }
    }
    
    func setup(attachments: [AttachmentDto]) {
        self.attachments = attachments
        collectionView.reloadData()
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
            let width = collectionView.frame.width
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

// MARK: - Private functions
extension AttachmentsCollectionViewDataSource {
    private func initialSetup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: AttachmentVideoCollectionViewCell.cellName,
                                      bundle: nil),
                                forCellWithReuseIdentifier: AttachmentVideoCollectionViewCell.cellName)
        collectionView.register(UINib(nibName: AttachmentPhotoCollectionViewCell.cellName,
                                      bundle: nil),
                                forCellWithReuseIdentifier: AttachmentPhotoCollectionViewCell.cellName)
    }
}

// MARK: - UICollectionViewDelegate
extension AttachmentsCollectionViewDataSource: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension AttachmentsCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let photoAttachments = attachments?.filter({ $0.type == .photo }) ?? []
        
        var strings = [String]()
        for _ in 0..<15 {
            strings.append("")
        }
        
        for i in 0..<photoAttachments.count {
            guard let photoDto = photoAttachments[i].photo else {
                return 0
            }
            strings[0] += "\(i+1) фото\t\t"
            strings[1] += "\(photoDto.sizes.count) размеров\t"
            var j = 2
            photoDto.sizes.forEach {
                let wxh = "\($0.width)x\($0.height)"
                let aspRatio = ((CGFloat($0.width)/CGFloat($0.height))*100).rounded() / 100.0
                strings[j] += "\(wxh) \(aspRatio)\t\t"
                j += 1
            }
            let urlString = "\(photoDto.sizes.last!.url)\t"
            strings[j] += urlString
        }
        
        if photoAttachments.count == 10 {
            print("101010101010")
        }
        
        print("\n\n\n************Photo info*************")
        for i in 0..<15 {
            print(strings[i])
        }
        
        return photoAttachments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoAttachments = attachments?.filter({ $0.type == .photo }) ?? []
        let attachment = photoAttachments[indexPath.row]
        
        switch attachment.type {
        case .photo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttachmentPhotoCollectionViewCell.cellName, for: indexPath) as? AttachmentPhotoCollectionViewCell,
                let photoDto = attachment.photo else {
                return UICollectionViewCell()
            }
            cell.setup(photoDto: photoDto)
            return cell
        case .video:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AttachmentVideoCollectionViewCell.cellName, for: indexPath) as? AttachmentVideoCollectionViewCell,
                let videoDto = attachment.video else {
                return UICollectionViewCell()
            }
            cell.setup(videoDto: videoDto)
            return cell
        case .market:
            return UICollectionViewCell()
        case .marketAlbum:
            return UICollectionViewCell()
        case .prettyCards:
            return UICollectionViewCell()
        case .podcast:
            return UICollectionViewCell()
        case .audio:
            return UICollectionViewCell()
        case .doc:
            return UICollectionViewCell()
        case .link:
            return UICollectionViewCell()
        case .note:
            return UICollectionViewCell()
        case .poll:
            return UICollectionViewCell()
        case .page:
            return UICollectionViewCell()
        case .album:
            return UICollectionViewCell()
        case .photosList:
            return UICollectionViewCell()
        }
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension AttachmentsCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (attachments?.count == 1),
            let photo = attachments?.first?.photo,
            photo.sizes.count > 0 {
            let photoSizes = photo.sizes
            let photoSizesOrderArray = ["z", "y", "x", "w"]
            let properPhotoSize = photoSizes.sorted(by: {
                guard let index0 = photoSizesOrderArray.index(of: $0.type) else { return false }
                guard let index1 = photoSizesOrderArray.index(of: $1.type) else { return true }
                return index0 <= index1
                }).first
            let width = collectionView.frame.width
            let height = CGFloat(properPhotoSize?.height ?? 0) / CGFloat(properPhotoSize?.width ?? 1) * width
            
            return CGSize(width: width, height: height)
        }
        
        let width = collectionView.bounds.width / 2.0 - 5.0
        let height = CGFloat(120.0)
        
        return CGSize(width: width, height: height)
    }
}
