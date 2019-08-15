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
    private let fillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)

    private lazy var likeLayer: CAShapeLayer = {
        let likeLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: bounds.minX + 0.50000 * bounds.width, y: bounds.minY + 0.98298 * bounds.height))
        bezierPath.addLine(to: CGPoint(x: bounds.minX + 0.43192 * bounds.width, y: bounds.minY + 0.90900 * bounds.height))
        bezierPath.addCurve(to: CGPoint(x: bounds.minX + 0.01373 * bounds.width, y: bounds.minY + 0.30128 * bounds.height), controlPoint1: CGPoint(x: bounds.minX + 0.17906 * bounds.width, y: bounds.minY + 0.66591 * bounds.height), controlPoint2: CGPoint(x: bounds.minX + 0.01373 * bounds.width, y: bounds.minY + 0.50209 * bounds.height))
        bezierPath.addCurve(to: CGPoint(x: bounds.minX + 0.28118 * bounds.width, y: bounds.minY + 0.01064 * bounds.height), controlPoint1: CGPoint(x: bounds.minX + 0.01373 * bounds.width, y: bounds.minY + 0.13747 * bounds.height), controlPoint2: CGPoint(x: bounds.minX + 0.13043 * bounds.width, y: bounds.minY + 0.01064 * bounds.height))
        bezierPath.addCurve(to: CGPoint(x: bounds.minX + 0.50000 * bounds.width, y: bounds.minY + 0.12161 * bounds.height), controlPoint1: CGPoint(x: bounds.minX + 0.36384 * bounds.width, y: bounds.minY + 0.01064 * bounds.height), controlPoint2: CGPoint(x: bounds.minX + 0.44651 * bounds.width, y: bounds.minY + 0.05291 * bounds.height))
        bezierPath.addCurve(to: CGPoint(x: bounds.minX + 0.71882 * bounds.width, y: bounds.minY + 0.01064 * bounds.height), controlPoint1: CGPoint(x: bounds.minX + 0.55349 * bounds.width, y: bounds.minY + 0.05291 * bounds.height), controlPoint2: CGPoint(x: bounds.minX + 0.63616 * bounds.width, y: bounds.minY + 0.01064 * bounds.height))
        bezierPath.addCurve(to: CGPoint(x: bounds.minX + 0.98627 * bounds.width, y: bounds.minY + 0.30128 * bounds.height), controlPoint1: CGPoint(x: bounds.minX + 0.86957 * bounds.width, y: bounds.minY + 0.01064 * bounds.height), controlPoint2: CGPoint(x: bounds.minX + 0.98627 * bounds.width, y: bounds.minY + 0.13747 * bounds.height))
        bezierPath.addCurve(to: CGPoint(x: bounds.minX + 0.56808 * bounds.width, y: bounds.minY + 0.90900 * bounds.height), controlPoint1: CGPoint(x: bounds.minX + 0.98627 * bounds.width, y: bounds.minY + 0.50209 * bounds.height), controlPoint2: CGPoint(x: bounds.minX + 0.82094 * bounds.width, y: bounds.minY + 0.66591 * bounds.height))
        bezierPath.addLine(to: CGPoint(x: bounds.minX + 0.50000 * bounds.width, y: bounds.minY + 0.98298 * bounds.height))

        bezierPath.close()
        fillColor.setFill()
        bezierPath.fill()
        blueMain.setStroke()
        bezierPath.lineWidth = 2.5
        bezierPath.stroke()

        likeLayer.path = bezierPath.cgPath
        return likeLayer
    }()
        
    override init(frame: CGRect) {
      super.init(frame: frame)
//      configureAppearance()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
//      configureAppearance()
    }
    
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
        likeLayer.frame = bounds
        layer.addSublayer(likeLayer)
        likeLayer.setNeedsDisplay()
    }
    
    private func configOther() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        configureAppearance()
    }
        
    override var frame: CGRect {
        didSet {
            configureAppearance()
        }
    }
}
