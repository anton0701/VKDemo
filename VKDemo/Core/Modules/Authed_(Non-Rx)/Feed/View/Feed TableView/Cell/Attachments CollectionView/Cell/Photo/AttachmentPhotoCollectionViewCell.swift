//
//  AttachmentPhotoCollectionViewCell.swift
//  VKDemo
//
//  Created by Anton Krylov on 29/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit


class AttachmentPhotoCollectionViewCell: UICollectionViewCell {
    static let cellName: String = String(describing: AttachmentPhotoCollectionViewCell.self)
    
    var photoDto: PhotoDto?
    var photoUrlString: String?
    
    let photoSizesOrderArray = ["z", "y", "x", "w"]
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(photoDto: PhotoDto) {
        self.photoDto = photoDto
        
        guard let properSizedPhotoDto = photoDto.sizes.sorted(by: {
            guard let index0 = photoSizesOrderArray.index(of: $0.type) else { return false }
            guard let index1 = photoSizesOrderArray.index(of: $1.type) else { return true }
            return  index0 <= index1
        }).first else {
            return
        }
        
//        guard let originalPhotoUrl = photoDto.sizes.first?.url as String? else {
//            return
//        }
        
        properSizedPhotoDto.url.getAsyncImageFromUrl(completion: { image, urlStrig in
//            guard urlStrig == originalPhotoUrl else {
//                return
//            }
            self.imageView.image = image
        })
    }
}
