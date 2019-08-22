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

    @IBOutlet weak var textView: UITextView!
    
    func setup(text: String) {
        textView.text = text
        layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()        
    }
}
