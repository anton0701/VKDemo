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
//            print("\(i+1) фото")
//            print("\(photoDto.sizes.count) размеров")
            var j = 2
            photoDto.sizes.forEach {
                let wxh = "\($0.width)x\($0.height)"
                let aspRatio = ((CGFloat($0.height)/CGFloat($0.width))*100).rounded() / 100.0
                strings[j] += "\(wxh) \(aspRatio)\t\t"
                j += 1
//                print("\(wxh) \(aspRatio)")
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
                
//        return attachments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let photoAttachments = attachments?.filter({ $0.type == .photo }) ?? []
        let attachment = photoAttachments[indexPath.row]
        
//        let photoVideoAttachments = attachments?.filter({ $0.type == .video || $0.type == .photo }) ?? []
//        let attachment = photoVideoAttachments[indexPath.row]
        
        //  1 фото          2 фото
        //  10 размеров     7 размеров
        //  19х38 (1х2)
        //  100х200 (1х2)
        //  ......
        //
        /*
        var strings = [String]()
        for _ in 0..<15 {
            strings.append("")
        }
        
        for i in 0..<photoAttachments.count {
            guard let photoDto = photoAttachments[i].photo else {
                return UICollectionViewCell()
            }
            strings[0] += "\(i+1) фото\t\t"
            strings[1] += "\(photoDto.sizes.count) размеров\t"
//            print("\(i+1) фото")
//            print("\(photoDto.sizes.count) размеров")
            var j = 2
            photoDto.sizes.forEach {
                let wxh = "\($0.width)x\($0.height)"
                let aspRatio = ((CGFloat($0.height)/CGFloat($0.width))*100).rounded() / 100.0
                strings[j] += "\(wxh) \(aspRatio)\t\t"
                j += 1
//                print("\(wxh) \(aspRatio)")
            }
            let urlString = "\(photoDto.sizes.last!.url)\t"
            strings[j] += urlString
        }
        
        print("\n\n\n************Photo info*************")
        for i in 0..<15 {
            print(strings[i])
        }
        */
        
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
