//
//  AttachmentsCollectionViewCell.swift
//  VKDemo
//
//  Created by Anton Krylov on 28/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class AttachmentsCollectionViewCell: UICollectionViewCell {
    static let cellName: String = String(describing: AttachmentsCollectionViewCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
}
