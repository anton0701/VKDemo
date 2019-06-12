//
//  UIView+InCallStatusBar.swift
//  Vanilla
//
//  Created by Dmitry Spirichev on 14.08.2018.
//  Copyright © 2018 BrightBox. All rights reserved.
//

import UIKit

extension UIView {
    func setInCallSafeFrame() {
        self.autoresizingMask = [.flexibleHeight, .flexibleTopMargin]
    }
}
