//
//  FeedTextView.swift
//  VKDemo
//
//  Created by Anton Krylov on 07.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class FeedTextView: UITextView {
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        font = UIFont.systemFont(ofSize: 14.0)
        isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        font = UIFont.systemFont(ofSize: 14.0)
        isScrollEnabled = false
    }
}
