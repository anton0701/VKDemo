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

    fileprivate func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
    
    private let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    private let likedFillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    private let notLikedFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)
    
    override var frame: CGRect {
        didSet {
            configureAppearance()
        }
    }

    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
//        guard backgroundLayer.bounds != bounds
//        else {return}
        
        for layer in [
          heartLayer,
          borderLayer
        ] {
          layer.bounds = bounds
          layer.position = center
        }
        configureAppearance()
    }
    
    private lazy var heartLayer: CAShapeLayer = {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.98298 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.43192 * frame.width, y: frame.minY + 0.90900 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.01373 * frame.width, y: frame.minY + 0.30128 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.17906 * frame.width, y: frame.minY + 0.66591 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.01373 * frame.width, y: frame.minY + 0.50209 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.28118 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.01373 * frame.width, y: frame.minY + 0.13747 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.13043 * frame.width, y: frame.minY + 0.01064 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.12161 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36384 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.44651 * frame.width, y: frame.minY + 0.05291 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.71882 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55349 * frame.width, y: frame.minY + 0.05291 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63616 * frame.width, y: frame.minY + 0.01064 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.98627 * frame.width, y: frame.minY + 0.30128 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.86957 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.98627 * frame.width, y: frame.minY + 0.13747 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.56808 * frame.width, y: frame.minY + 0.90900 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.98627 * frame.width, y: frame.minY + 0.50209 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.82094 * frame.width, y: frame.minY + 0.66591 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.98298 * frame.height))
        bezierPath.close()
        UIColor.white.setFill()
        bezierPath.fill()
        UIColor.lightGray.setStroke()
        bezierPath.lineWidth = 6.5
        bezierPath.miterLimit = 4
        bezierPath.stroke()
        
        let layer = CAShapeLayer()
        layer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        
        return layer
    }()
    
    private lazy var borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: frame.minX + fastFloor(frame.width * 0.01838 + 0.5), y: frame.minY + fastFloor(frame.height * 0.04064 + 0.5), width: fastFloor(frame.width * 0.98162 + 0.5) - fastFloor(frame.width * 0.01838 + 0.5), height: fastFloor(frame.height * 0.96466 + 0.5) - fastFloor(frame.height * 0.04064 + 0.5)), cornerRadius: 40)
        fillColor.setStroke()
        bezierPath.lineWidth = 5.5
        bezierPath.lineCapStyle = .round
        bezierPath.lineJoinStyle = .round
        bezierPath.stroke()

        layer.path = bezierPath.cgPath
        layer.strokeColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.fillColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        
        return layer
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
//        backgroundColor = .clear
//        if heartLayer.superlayer == nil {
            layer.addSublayer(heartLayer)
            layer.addSublayer(borderLayer)
//        }
    }
    
    private func configOther() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        configureAppearance()
    }
}


            //// Text Drawing
//            let textRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.50995 + 0.5), y: frame.minY + fastFloor(frame.height * 0.26855 + 0.5), width: fastFloor(frame.width * 0.87060 + 0.5) - fastFloor(frame.width * 0.50995 + 0.5), height: fastFloor(frame.height * 0.73675 + 0.5) - fastFloor(frame.height * 0.26855 + 0.5))
//            let textTextContent = "999"
//            let textStyle = NSMutableParagraphStyle()
//            textStyle.alignment = .left
//            let textFontAttributes = [
//                .font: UIFont.systemFont(ofSize: 190),
//                .foregroundColor: UIColor.black,
//                .paragraphStyle: textStyle,
//            ] as [NSAttributedString.Key: Any]
//
//            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
//            context.saveGState()
//            context.clip(to: textRect)
//            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
//            context.restoreGState()
