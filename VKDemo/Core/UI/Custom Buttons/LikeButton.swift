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
    
    private let fillColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    private let heartStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    private let borderStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    private let likedFillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    private let notLikedFillColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)
    
    override var frame: CGRect {
        didSet {
            configureLayers()
        }
    }

    private lazy var heartLayer: CAShapeLayer = {
        
        let heartPath = UIBezierPath()
        heartPath.move(to: CGPoint(x: 21.85, y: 32.5))
        heartPath.addLine(to: CGPoint(x: 20.38, y: 30.99))
        heartPath.addCurve(to: CGPoint(x: 11.35, y: 17.8), controlPoint1: CGPoint(x: 14.92, y: 25.71), controlPoint2: CGPoint(x: 11.35, y: 22.16))
        heartPath.addCurve(to: CGPoint(x: 17.12, y: 11.5), controlPoint1: CGPoint(x: 11.35, y: 14.25), controlPoint2: CGPoint(x: 13.87, y: 11.5))
        heartPath.addCurve(to: CGPoint(x: 21.85, y: 13.91), controlPoint1: CGPoint(x: 18.91, y: 11.5), controlPoint2: CGPoint(x: 20.7, y: 12.42))
        heartPath.addCurve(to: CGPoint(x: 26.57, y: 11.5), controlPoint1: CGPoint(x: 23.01, y: 12.42), controlPoint2: CGPoint(x: 24.79, y: 11.5))
        heartPath.addCurve(to: CGPoint(x: 32.35, y: 17.8), controlPoint1: CGPoint(x: 29.83, y: 11.5), controlPoint2: CGPoint(x: 32.35, y: 14.25))
        heartPath.addCurve(to: CGPoint(x: 23.32, y: 30.99), controlPoint1: CGPoint(x: 32.35, y: 22.16), controlPoint2: CGPoint(x: 28.78, y: 25.71))
        heartPath.addLine(to: CGPoint(x: 21.85, y: 32.5))
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
        
        return layer
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "123"
        label.frame = CGRect(x: 42, y: 11, width: 41, height: 21)
        
        return label
    }()
    
    private func addLayers() {
        [borderLayer, heartLayer].forEach { layer.addSublayer($0) }
        addSubview(label)
    }
    
    private func removeLayersIfNeeded() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    private func configureLayers() {
        removeLayersIfNeeded()
        addLayers()
        
        for subLayer in [
          borderLayer,
          heartLayer
        ] {
            subLayer.frame = bounds
            subLayer.setNeedsDisplay()
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
