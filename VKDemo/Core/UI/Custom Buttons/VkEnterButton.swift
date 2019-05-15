//
//  VkEnterButton.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class VkEnterButton: UIButton {
    
    private let activeBgColor = UIColor(red: 60/255, green: 100/255, blue: 160/255, alpha: 1.0)
    private let highlightedBgColor = UIColor(red: 62/255, green: 90/255, blue: 140/255, alpha: 1.0)
    private let disabledBgColor = UIColor(red: 105/255, green: 145/255, blue: 205/255, alpha: 1.0)
    
    private let activeFontColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0)
    private let highlightedFontColor = UIColor(red: 156/255, green: 176/255, blue: 212/255, alpha: 1.0)
    private let disabledFontColor = UIColor(red: 170/255, green: 170/255, blue: 190/255, alpha: 1.0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setTitle("Войти", for: .normal)
        
        setBackgroundColor(color: activeBgColor, forState: .normal)
        setBackgroundColor(color: highlightedBgColor, forState: .highlighted)
        setBackgroundColor(color: disabledBgColor, forState: .disabled)
        
        setTitleColor(activeFontColor, for: .normal)
        setTitleColor(disabledFontColor, for: .disabled)
        setTitleColor(highlightedFontColor, for: .highlighted)
        
        layer.cornerRadius = 15.0
    }
}
