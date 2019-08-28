//
//  AttachmentVideoCollectionViewCell.swift
//  VKDemo
//
//  Created by Anton Krylov on 28/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class AttachmentVideoCollectionViewCell: UICollectionViewCell {
    static let cellName: String = String(describing: AttachmentVideoCollectionViewCell.self)
    
    var videoDto: VideoDto?
    var photoUrlString: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(videoDto: VideoDto) {
        self.videoDto = videoDto
        
        guard let appropriatePhotoUrlString = [videoDto.photo1280,
                                         videoDto.photo800,
                                         videoDto.photo640,
                                         videoDto.photo320]
                                        .compactMap({$0})
                                        .first
            else {
                imageView.image = nil
                photoUrlString = nil
                return
        }
        
        photoUrlString = appropriatePhotoUrlString
        
        appropriatePhotoUrlString.getAsyncImageFromUrl { [weak self] image, url in
            guard let strongSelf = self,
                let photoUrlString = strongSelf.photoUrlString,
                photoUrlString == url,
                let image = image,
                let strongImageView = strongSelf.imageView  else {
                return
            }
            
            UIView.transition(with: strongImageView,
                              duration: 0.3,
                              options: .transitionCrossDissolve,
                              animations: {
                strongImageView.image = image
            }, completion: nil)
        }

    }
}
