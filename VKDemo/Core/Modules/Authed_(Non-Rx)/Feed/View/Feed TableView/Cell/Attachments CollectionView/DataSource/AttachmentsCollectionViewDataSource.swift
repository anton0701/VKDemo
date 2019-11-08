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
    
    func generateLayout() -> UICollectionViewLayout {
      // We have three row styles
      // Style 1: 'Full'
      // A full width photo
      // Style 2: 'Main with pair'
      // A 2/3 width photo with two 1/3 width photos stacked vertically
      // Style 3: 'Triplet'
      // Three 1/3 width photos stacked horizontally

      // Full
      let fullPhotoItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(3/2)))
      fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      // Main with pair
      let mainItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(2/3),
          heightDimension: .fractionalHeight(1.0)))
      mainItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let pairItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalHeight(0.5)))
      pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
      let trailingGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1/3),
          heightDimension: .fractionalHeight(1.0)),
        subitem: pairItem,
        count: 2)

      let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(4/9)),
        subitems: [mainItem, trailingGroup])

      // Triplet
      let tripletItem1 = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3.35),
          heightDimension: .fractionalHeight(1.0)))

        let tripletItem2 = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.35/3.35),
          heightDimension: .fractionalHeight(1.0)))
        
        let tripletItem3 = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3.35),
          heightDimension: .fractionalHeight(1.0)))
        tripletItem1.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        tripletItem2.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        tripletItem3.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

      let tripletGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(2/3)),
        subitems: [tripletItem1, tripletItem2, tripletItem3])

      // Reversed main with pair
      let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(4/9)),
        subitems: [trailingGroup, mainItem])

      let nestedGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(16/9)),
        subitems: [fullPhotoItem, mainWithPairGroup, tripletGroup, mainWithPairReversedGroup])

      let section = NSCollectionLayoutSection(group: nestedGroup)
      let layout = UICollectionViewCompositionalLayout(section: section)
      return layout
    }

    func generateLayoutGroupForSinglePhoto() -> NSCollectionLayoutGroup {
        // Full
        let fullPhotoItem = NSCollectionLayoutItem(
          layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(3/2)))
        fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

        let width = collectionView.frame.width
        let photo = attachments![0].photo!
        let photoSize = photo.sizes.correctSize()
        let photoRatio = CGFloat(photoSize.height) / CGFloat(photoSize.width)
        let photoHeight = photoRatio * width
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(photoRatio)),
                                                                                                subitem: fullPhotoItem,
                                                                                                count: 1)
        let height = collectionView.frame.size.width / fullPhotoItem.layoutSize.widthDimension.dimension
        return layoutGroup
    }
    
    func setup(attachments: [AttachmentDto]) {
        self.attachments = attachments
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
        collectionView.reloadData()
    }
    
    func collectionViewHeight(for attachments: [AttachmentDto]) -> CGFloat {
        if (attachments.count == 1),
            let photo = attachments.first?.photo,
            photo.sizes.count > 0 {
            let photoSizes = photo.sizes
            let photoSizesOrderArray = ["z", "y", "x", "w"]
            let properPhotoSize = photoSizes.correctSize()
            
//                photoSizes.sorted(by: {
//                guard let index0 = photoSizesOrderArray.index(of: $0.type) else { return false }
//                guard let index1 = photoSizesOrderArray.index(of: $1.type) else { return true }
//                return index0 <= index1
//                }).first
            
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
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if (attachments?.count == 1),
//            let photo = attachments?.first?.photo,
//            photo.sizes.count > 0 {
//            let photoSizes = photo.sizes
//            let photoSizesOrderArray = ["z", "y", "x", "w"]
//            let properPhotoSize = photoSizes.sorted(by: {
//                guard let index0 = photoSizesOrderArray.index(of: $0.type) else { return false }
//                guard let index1 = photoSizesOrderArray.index(of: $1.type) else { return true }
//                return index0 <= index1
//                }).first
//            let width = collectionView.frame.width
//            let height = CGFloat(properPhotoSize?.height ?? 0) / CGFloat(properPhotoSize?.width ?? 1) * width
//
//            return CGSize(width: width, height: height)
//        }
//
//        let width = collectionView.bounds.width / 2.0 - 5.0
//        let height = CGFloat(120.0)
//
//        return CGSize(width: width, height: height)
//    }
}
