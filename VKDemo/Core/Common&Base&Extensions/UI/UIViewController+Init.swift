//
//  UIViewController+Init.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromXib(bundle: Bundle? = nil, overriddenXib: String? = nil) -> Self {
        return self.init(nibName: overriddenXib ?? String(describing: self), bundle: bundle)
    }
}
