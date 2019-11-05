//
//  UIView+Init.swift
//  VKDemo
//
//  Created by Anton Krylov on 05.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit

extension UIView {
    static func loadFromXib() -> UIView? {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: String(describing: self), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView

        return view
    }
}
