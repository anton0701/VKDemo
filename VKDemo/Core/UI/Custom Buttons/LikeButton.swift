//
//  LikeButton.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class LikeButton: UIControl {

    private let likedFillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    private let notLikedFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)
    
    override var frame: CGRect {
        didSet {
            configureAppearance()
        }
    }
    
    private lazy var likeLayer: CAShapeLayer = {
        let likeLayer = CAShapeLayer()
        
        likeLayer.path = UIBezierPath
            .heartPath(frame: bounds)
            .cgPath
        likeLayer.lineWidth = 2.5
        likeLayer.fillColor = notLikedFillColor.cgColor
        likeLayer.strokeColor = blueMain.cgColor
        
        return likeLayer
    }()
            
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureAppearance()
    }
    
    private func configureAppearance() {
        configureLayers()
        configOther()
    }
    
    private func configureLayers() {
        backgroundColor = .clear
        if likeLayer.superlayer == nil {
            layer.addSublayer(likeLayer)
        }
    }
    
    private func configOther() {
        
    }
}
