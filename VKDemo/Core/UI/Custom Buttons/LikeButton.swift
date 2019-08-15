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
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        let context = ctx
            func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }

            //// Color Declarations
            let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
        
            let bezierPath = UIBezierPath(roundedRect: CGRect(x: frame.minX + fastFloor(frame.width * 0.01838 + 0.5), y: frame.minY + fastFloor(frame.height * 0.04064 + 0.5), width: fastFloor(frame.width * 0.98162 + 0.5) - fastFloor(frame.width * 0.01838 + 0.5), height: fastFloor(frame.height * 0.96466 + 0.5) - fastFloor(frame.height * 0.04064 + 0.5)), cornerRadius: 40)
            fillColor.setStroke()
            bezierPath.lineWidth = 5.5
            bezierPath.lineCapStyle = .round
            bezierPath.lineJoinStyle = .round
            bezierPath.stroke()


            //// Bezier Drawing
            bezierPath.move(to: CGPoint(x: frame.minX + 0.24502 * frame.width, y: frame.minY + 0.90459 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.21844 * frame.width, y: frame.minY + 0.84669 * frame.height))
            bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.05513 * frame.width, y: frame.minY + 0.34206 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.11969 * frame.width, y: frame.minY + 0.64484 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.05513 * frame.width, y: frame.minY + 0.50881 * frame.height))
            bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.15957 * frame.width, y: frame.minY + 0.10071 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.05513 * frame.width, y: frame.minY + 0.20602 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.10070 * frame.width, y: frame.minY + 0.10071 * frame.height))
            bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.24502 * frame.width, y: frame.minY + 0.19286 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.19185 * frame.width, y: frame.minY + 0.10071 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.22413 * frame.width, y: frame.minY + 0.13581 * frame.height))
            bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.33047 * frame.width, y: frame.minY + 0.10071 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.26591 * frame.width, y: frame.minY + 0.13581 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.29819 * frame.width, y: frame.minY + 0.10071 * frame.height))
            bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.43492 * frame.width, y: frame.minY + 0.34206 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38934 * frame.width, y: frame.minY + 0.10071 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43492 * frame.width, y: frame.minY + 0.20602 * frame.height))
            bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.27161 * frame.width, y: frame.minY + 0.84669 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.43492 * frame.width, y: frame.minY + 0.50881 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.37035 * frame.width, y: frame.minY + 0.64484 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.24502 * frame.width, y: frame.minY + 0.90459 * frame.height))
            bezierPath.close()
            UIColor.white.setFill()
            bezierPath.fill()
            UIColor.lightGray.setStroke()
            bezierPath.lineWidth = 6.5
            bezierPath.miterLimit = 4
            bezierPath.stroke()


            //// Text Drawing
            let textRect = CGRect(x: frame.minX + fastFloor(frame.width * 0.50995 + 0.5), y: frame.minY + fastFloor(frame.height * 0.26855 + 0.5), width: fastFloor(frame.width * 0.87060 + 0.5) - fastFloor(frame.width * 0.50995 + 0.5), height: fastFloor(frame.height * 0.73675 + 0.5) - fastFloor(frame.height * 0.26855 + 0.5))
            let textTextContent = "999"
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .left
            let textFontAttributes = [
                .font: UIFont.systemFont(ofSize: 190),
                .foregroundColor: UIColor.black,
                .paragraphStyle: textStyle,
            ] as [NSAttributedString.Key: Any]

            let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
            context.saveGState()
            context.clip(to: textRect)
            textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
            context.restoreGState()

        likeLayer.path = bezierPath.cgPath
        likeLayer.lineWidth = 2.5
        likeLayer.fillColor = notLikedFillColor.cgColor
        likeLayer.strokeColor = blueMain.cgColor
    }
    
    private var likeLayer = CAShapeLayer()
            
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
}
