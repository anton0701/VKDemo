//
//  RepliesButton.swift
//  VKDemo
//
//  Created by Anton Krylov on 20/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable
class RepliesButton: UIControl {
    
    private let plashkaFillColor = UIColor.white
    private let fillColor = UIColor.clear
    private let strokeColor = UIColor(white: 0.7, alpha: 1.0)
    private let borderStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    
    private lazy var repliesIconLayer: CAShapeLayer = {
        let repliesIconPath = UIBezierPath()
        repliesIconPath.move(to: CGPoint(x: 15.88, y: 17.62))
        repliesIconPath.addCurve(to: CGPoint(x: 11.5, y: 22), controlPoint1: CGPoint(x: 13.46, y: 17.62), controlPoint2: CGPoint(x: 11.5, y: 19.58))
        repliesIconPath.addCurve(to: CGPoint(x: 15.88, y: 26.38), controlPoint1: CGPoint(x: 11.5, y: 24.42), controlPoint2: CGPoint(x: 13.46, y: 26.38))
        repliesIconPath.addCurve(to: CGPoint(x: 20.25, y: 22), controlPoint1: CGPoint(x: 18.29, y: 26.38), controlPoint2: CGPoint(x: 20.25, y: 24.42))
        repliesIconPath.addCurve(to: CGPoint(x: 15.88, y: 17.62), controlPoint1: CGPoint(x: 20.25, y: 19.58), controlPoint2: CGPoint(x: 18.29, y: 17.62))
        repliesIconPath.close()
        repliesIconPath.move(to: CGPoint(x: 21.63, y: 19.92))
        repliesIconPath.addLine(to: CGPoint(x: 26.43, y: 17.36))
        repliesIconPath.addCurve(to: CGPoint(x: 29, y: 18.5), controlPoint1: CGPoint(x: 27.07, y: 18.06), controlPoint2: CGPoint(x: 27.98, y: 18.5))
        repliesIconPath.addCurve(to: CGPoint(x: 32.5, y: 15), controlPoint1: CGPoint(x: 30.93, y: 18.5), controlPoint2: CGPoint(x: 32.5, y: 16.93))
        repliesIconPath.addCurve(to: CGPoint(x: 29, y: 11.5), controlPoint1: CGPoint(x: 32.5, y: 13.07), controlPoint2: CGPoint(x: 30.93, y: 11.5))
        repliesIconPath.addCurve(to: CGPoint(x: 25.5, y: 15), controlPoint1: CGPoint(x: 27.07, y: 11.5), controlPoint2: CGPoint(x: 25.5, y: 13.07))
        repliesIconPath.addCurve(to: CGPoint(x: 25.61, y: 15.82), controlPoint1: CGPoint(x: 25.5, y: 15.28), controlPoint2: CGPoint(x: 25.54, y: 15.55))
        repliesIconPath.addLine(to: CGPoint(x: 20.8, y: 18.38))
        repliesIconPath.addCurve(to: CGPoint(x: 21.63, y: 19.92), controlPoint1: CGPoint(x: 21.15, y: 18.85), controlPoint2: CGPoint(x: 21.43, y: 19.37))
        repliesIconPath.close()
        repliesIconPath.move(to: CGPoint(x: 29, y: 25.5))
        repliesIconPath.addCurve(to: CGPoint(x: 26.43, y: 26.64), controlPoint1: CGPoint(x: 27.98, y: 25.5), controlPoint2: CGPoint(x: 27.07, y: 25.94))
        repliesIconPath.addLine(to: CGPoint(x: 21.63, y: 24.08))
        repliesIconPath.addCurve(to: CGPoint(x: 20.8, y: 25.62), controlPoint1: CGPoint(x: 21.43, y: 24.63), controlPoint2: CGPoint(x: 21.15, y: 25.15))
        repliesIconPath.addLine(to: CGPoint(x: 25.61, y: 28.18))
        repliesIconPath.addCurve(to: CGPoint(x: 25.5, y: 29), controlPoint1: CGPoint(x: 25.54, y: 28.45), controlPoint2: CGPoint(x: 25.5, y: 28.72))
        repliesIconPath.addCurve(to: CGPoint(x: 29, y: 32.5), controlPoint1: CGPoint(x: 25.5, y: 30.93), controlPoint2: CGPoint(x: 27.07, y: 32.5))
        repliesIconPath.addCurve(to: CGPoint(x: 32.5, y: 29), controlPoint1: CGPoint(x: 30.93, y: 32.5), controlPoint2: CGPoint(x: 32.5, y: 30.93))
        repliesIconPath.addCurve(to: CGPoint(x: 29, y: 25.5), controlPoint1: CGPoint(x: 32.5, y: 27.07), controlPoint2: CGPoint(x: 30.93, y: 25.5))
        repliesIconPath.close()
        strokeColor.setStroke()
        repliesIconPath.stroke()

        let layer = CAShapeLayer()
        layer.path = repliesIconPath.cgPath
        layer.fillColor = fillColor.cgColor
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 1.0
        
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
        layer.fillColor = plashkaFillColor.cgColor
        layer.lineWidth = 0.5
        
        return layer
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.3, alpha: 1.0)
        label.text = "123"
        label.frame = CGRect(x: 42, y: 11, width: 41, height: 21)
        label.font = UIFont.systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private func addLayers() {
        [borderLayer, repliesIconLayer].forEach { layer.addSublayer($0) }
        addSubview(countLabel)
    }
    
    private func removeLayersIfNeeded() {
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
    
    private func configureLayers() {
        removeLayersIfNeeded()
        addLayers()
        
        for subLayer in [
          borderLayer,
          repliesIconLayer
        ] {
            subLayer.frame = bounds
            subLayer.setNeedsDisplay()
        }
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addLayers()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addLayers()
        backgroundColor = .clear
    }
    
    public func setup(repliesCount: Int) {
        countLabel.text = "\(repliesCount)"
    }
}
