//
//  LikeButton.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable
class LikeButton: UIControl {
    
//    private let fillColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)
    let fillColor = UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1.000)
    let heartStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    let borderStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
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
                
        for layer in [
          borderLayer,
          heartLayer
        ] {
          layer.bounds = bounds
          layer.position = center
        }
        configureAppearance()
    }
    
    private lazy var heartLayer: CAShapeLayer = {
        let heartPath = UIBezierPath()
        heartPath.move(to: CGPoint(x: 21.85, y: 34))
        heartPath.addLine(to: CGPoint(x: 20.17, y: 32.27))
        heartPath.addCurve(to: CGPoint(x: 9.85, y: 17.21), controlPoint1: CGPoint(x: 13.93, y: 26.25), controlPoint2: CGPoint(x: 9.85, y: 22.18))
        heartPath.addCurve(to: CGPoint(x: 16.45, y: 10), controlPoint1: CGPoint(x: 9.85, y: 13.14), controlPoint2: CGPoint(x: 12.73, y: 10))
        heartPath.addCurve(to: CGPoint(x: 21.85, y: 12.75), controlPoint1: CGPoint(x: 18.49, y: 10), controlPoint2: CGPoint(x: 20.53, y: 11.05))
        heartPath.addCurve(to: CGPoint(x: 27.25, y: 10), controlPoint1: CGPoint(x: 23.17, y: 11.05), controlPoint2: CGPoint(x: 25.21, y: 10))
        heartPath.addCurve(to: CGPoint(x: 33.85, y: 17.21), controlPoint1: CGPoint(x: 30.97, y: 10), controlPoint2: CGPoint(x: 33.85, y: 13.14))
        heartPath.addCurve(to: CGPoint(x: 23.53, y: 32.27), controlPoint1: CGPoint(x: 33.85, y: 22.18), controlPoint2: CGPoint(x: 29.77, y: 26.25))
        heartPath.addLine(to: CGPoint(x: 21.85, y: 34))
        heartPath.close()
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        heartPath.fill()
        heartStrokeColor.setStroke()
        heartPath.lineCapStyle = .round
        heartPath.stroke()

        let layer = CAShapeLayer()
        layer.path = heartPath.cgPath
        layer.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.strokeColor = heartStrokeColor.cgColor
        layer.lineWidth = 2.0
        
        layer.frame = bounds
        
        return layer
    }()
    
    private lazy var borderLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 1, y: 1, width: 93, height: 42), cornerRadius: 21)
        fillColor.setStroke()
        rectanglePath.lineWidth = 0.5
        rectanglePath.lineCapStyle = .round
        rectanglePath.lineJoinStyle = .round
        rectanglePath.stroke()

        layer.path = rectanglePath.cgPath
        layer.strokeColor = borderStrokeColor.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineWidth = 0.5
        
        layer.frame = bounds
        
        return layer
    }()
                
    private func configureAppearance() {
        configureLayers()
        configOther()
    }
    
    private func configureLayers() {
        for subLayer in [
          borderLayer,
          heartLayer
        ] {
            layer.addSublayer(subLayer)
            subLayer.frame = bounds
            subLayer.setNeedsDisplay()
        }
    }
    
    private func configOther() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
