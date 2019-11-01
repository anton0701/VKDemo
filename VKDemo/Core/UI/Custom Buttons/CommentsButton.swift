//
//  CommentsButton.swift
//  VKDemo
//
//  Created by Anton Krylov on 20/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable
class CommentsButton: UIControl {
    private let plashkaFillColor = UIColor.white
    private let fillColor = UIColor.clear
    private let strokeColor = UIColor(white: 0.7, alpha: 1.0)
    private let borderStrokeColor = #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 0.5)
    
    private lazy var commentsIconLayer: CAShapeLayer = {
        let commentsPath = UIBezierPath()
        commentsPath.move(to: CGPoint(x: 30.29, y: 28.78))
        commentsPath.addCurve(to: CGPoint(x: 30.57, y: 29.42), controlPoint1: CGPoint(x: 30.38, y: 29.01), controlPoint2: CGPoint(x: 30.48, y: 29.22))
        commentsPath.addCurve(to: CGPoint(x: 30.92, y: 29.97), controlPoint1: CGPoint(x: 30.67, y: 29.61), controlPoint2: CGPoint(x: 30.79, y: 29.79))
        commentsPath.addCurve(to: CGPoint(x: 31.24, y: 30.39), controlPoint1: CGPoint(x: 31.06, y: 30.15), controlPoint2: CGPoint(x: 31.16, y: 30.28))
        commentsPath.addCurve(to: CGPoint(x: 31.6, y: 30.81), controlPoint1: CGPoint(x: 31.31, y: 30.49), controlPoint2: CGPoint(x: 31.43, y: 30.63))
        commentsPath.addCurve(to: CGPoint(x: 31.92, y: 31.17), controlPoint1: CGPoint(x: 31.77, y: 30.99), controlPoint2: CGPoint(x: 31.88, y: 31.11))
        commentsPath.addCurve(to: CGPoint(x: 31.98, y: 31.23), controlPoint1: CGPoint(x: 31.93, y: 31.18), controlPoint2: CGPoint(x: 31.95, y: 31.2))
        commentsPath.addCurve(to: CGPoint(x: 32.04, y: 31.3), controlPoint1: CGPoint(x: 32.01, y: 31.27), controlPoint2: CGPoint(x: 32.03, y: 31.29))
        commentsPath.addCurve(to: CGPoint(x: 32.1, y: 31.38), controlPoint1: CGPoint(x: 32.05, y: 31.32), controlPoint2: CGPoint(x: 32.07, y: 31.34))
        commentsPath.addCurve(to: CGPoint(x: 32.14, y: 31.46), controlPoint1: CGPoint(x: 32.12, y: 31.41), controlPoint2: CGPoint(x: 32.13, y: 31.44))
        commentsPath.addLine(to: CGPoint(x: 32.18, y: 31.53))
        commentsPath.addLine(to: CGPoint(x: 32.21, y: 31.61))
        commentsPath.addLine(to: CGPoint(x: 32.21, y: 31.71))
        commentsPath.addLine(to: CGPoint(x: 32.2, y: 31.8))
        commentsPath.addCurve(to: CGPoint(x: 32.02, y: 32.12), controlPoint1: CGPoint(x: 32.17, y: 31.93), controlPoint2: CGPoint(x: 32.11, y: 32.04))
        commentsPath.addCurve(to: CGPoint(x: 31.71, y: 32.22), controlPoint1: CGPoint(x: 31.93, y: 32.19), controlPoint2: CGPoint(x: 31.82, y: 32.23))
        commentsPath.addCurve(to: CGPoint(x: 30.51, y: 31.99), controlPoint1: CGPoint(x: 31.25, y: 32.15), controlPoint2: CGPoint(x: 30.85, y: 32.07))
        commentsPath.addCurve(to: CGPoint(x: 26.63, y: 30.15), controlPoint1: CGPoint(x: 29.08, y: 31.6), controlPoint2: CGPoint(x: 27.79, y: 30.99))
        commentsPath.addCurve(to: CGPoint(x: 24.18, y: 30.38), controlPoint1: CGPoint(x: 25.8, y: 30.3), controlPoint2: CGPoint(x: 24.98, y: 30.38))
        commentsPath.addCurve(to: CGPoint(x: 17.59, y: 28.48), controlPoint1: CGPoint(x: 21.66, y: 30.38), controlPoint2: CGPoint(x: 19.46, y: 29.75))
        commentsPath.addCurve(to: CGPoint(x: 18.82, y: 28.54), controlPoint1: CGPoint(x: 18.13, y: 28.52), controlPoint2: CGPoint(x: 18.54, y: 28.54))
        commentsPath.addCurve(to: CGPoint(x: 23.13, y: 27.89), controlPoint1: CGPoint(x: 20.32, y: 28.54), controlPoint2: CGPoint(x: 21.76, y: 28.33))
        commentsPath.addCurve(to: CGPoint(x: 26.82, y: 26.04), controlPoint1: CGPoint(x: 24.51, y: 27.46), controlPoint2: CGPoint(x: 25.74, y: 26.85))
        commentsPath.addCurve(to: CGPoint(x: 29.49, y: 23), controlPoint1: CGPoint(x: 27.98, y: 25.16), controlPoint2: CGPoint(x: 28.87, y: 24.15))
        commentsPath.addCurve(to: CGPoint(x: 30.43, y: 19.35), controlPoint1: CGPoint(x: 30.12, y: 21.85), controlPoint2: CGPoint(x: 30.43, y: 20.63))
        commentsPath.addCurve(to: CGPoint(x: 30.11, y: 17.17), controlPoint1: CGPoint(x: 30.43, y: 18.61), controlPoint2: CGPoint(x: 30.32, y: 17.89))
        commentsPath.addCurve(to: CGPoint(x: 32.95, y: 19.72), controlPoint1: CGPoint(x: 31.31, y: 17.85), controlPoint2: CGPoint(x: 32.26, y: 18.7))
        commentsPath.addCurve(to: CGPoint(x: 34, y: 23.03), controlPoint1: CGPoint(x: 33.65, y: 20.75), controlPoint2: CGPoint(x: 34, y: 21.85))
        commentsPath.addCurve(to: CGPoint(x: 33.01, y: 26.25), controlPoint1: CGPoint(x: 34, y: 24.18), controlPoint2: CGPoint(x: 33.67, y: 25.25))
        commentsPath.addCurve(to: CGPoint(x: 30.29, y: 28.78), controlPoint1: CGPoint(x: 32.35, y: 27.25), controlPoint2: CGPoint(x: 31.44, y: 28.1))
        commentsPath.close()
        commentsPath.move(to: CGPoint(x: 18.82, y: 12))
        commentsPath.addCurve(to: CGPoint(x: 23.75, y: 12.98), controlPoint1: CGPoint(x: 20.6, y: 12), controlPoint2: CGPoint(x: 22.24, y: 12.33))
        commentsPath.addCurve(to: CGPoint(x: 27.33, y: 15.66), controlPoint1: CGPoint(x: 25.26, y: 13.64), controlPoint2: CGPoint(x: 26.46, y: 14.53))
        commentsPath.addCurve(to: CGPoint(x: 28.64, y: 19.35), controlPoint1: CGPoint(x: 28.21, y: 16.79), controlPoint2: CGPoint(x: 28.64, y: 18.02))
        commentsPath.addCurve(to: CGPoint(x: 27.33, y: 23.04), controlPoint1: CGPoint(x: 28.64, y: 20.68), controlPoint2: CGPoint(x: 28.21, y: 21.91))
        commentsPath.addCurve(to: CGPoint(x: 23.75, y: 25.72), controlPoint1: CGPoint(x: 26.46, y: 24.17), controlPoint2: CGPoint(x: 25.26, y: 25.06))
        commentsPath.addCurve(to: CGPoint(x: 18.82, y: 26.7), controlPoint1: CGPoint(x: 22.24, y: 26.37), controlPoint2: CGPoint(x: 20.6, y: 26.7))
        commentsPath.addCurve(to: CGPoint(x: 16.37, y: 26.47), controlPoint1: CGPoint(x: 18.02, y: 26.7), controlPoint2: CGPoint(x: 17.2, y: 26.63))
        commentsPath.addCurve(to: CGPoint(x: 12.49, y: 28.31), controlPoint1: CGPoint(x: 15.21, y: 27.32), controlPoint2: CGPoint(x: 13.92, y: 27.93))
        commentsPath.addCurve(to: CGPoint(x: 11.29, y: 28.54), controlPoint1: CGPoint(x: 12.15, y: 28.4), controlPoint2: CGPoint(x: 11.75, y: 28.47))
        commentsPath.addLine(to: CGPoint(x: 11.25, y: 28.54))
        commentsPath.addCurve(to: CGPoint(x: 10.96, y: 28.43), controlPoint1: CGPoint(x: 11.14, y: 28.54), controlPoint2: CGPoint(x: 11.05, y: 28.5))
        commentsPath.addCurve(to: CGPoint(x: 10.8, y: 28.12), controlPoint1: CGPoint(x: 10.87, y: 28.35), controlPoint2: CGPoint(x: 10.82, y: 28.25))
        commentsPath.addCurve(to: CGPoint(x: 10.79, y: 28.03), controlPoint1: CGPoint(x: 10.79, y: 28.1), controlPoint2: CGPoint(x: 10.79, y: 28.06))
        commentsPath.addCurve(to: CGPoint(x: 10.79, y: 27.94), controlPoint1: CGPoint(x: 10.79, y: 28), controlPoint2: CGPoint(x: 10.79, y: 27.97))
        commentsPath.addCurve(to: CGPoint(x: 10.82, y: 27.85), controlPoint1: CGPoint(x: 10.8, y: 27.91), controlPoint2: CGPoint(x: 10.81, y: 27.88))
        commentsPath.addLine(to: CGPoint(x: 10.86, y: 27.78))
        commentsPath.addLine(to: CGPoint(x: 10.9, y: 27.7))
        commentsPath.addLine(to: CGPoint(x: 10.96, y: 27.63))
        commentsPath.addLine(to: CGPoint(x: 11.02, y: 27.56))
        commentsPath.addLine(to: CGPoint(x: 11.08, y: 27.49))
        commentsPath.addCurve(to: CGPoint(x: 11.4, y: 27.13), controlPoint1: CGPoint(x: 11.12, y: 27.43), controlPoint2: CGPoint(x: 11.23, y: 27.32))
        commentsPath.addCurve(to: CGPoint(x: 11.76, y: 26.71), controlPoint1: CGPoint(x: 11.57, y: 26.95), controlPoint2: CGPoint(x: 11.69, y: 26.81))
        commentsPath.addCurve(to: CGPoint(x: 12.08, y: 26.29), controlPoint1: CGPoint(x: 11.84, y: 26.61), controlPoint2: CGPoint(x: 11.94, y: 26.47))
        commentsPath.addCurve(to: CGPoint(x: 12.43, y: 25.74), controlPoint1: CGPoint(x: 12.21, y: 26.12), controlPoint2: CGPoint(x: 12.33, y: 25.93))
        commentsPath.addCurve(to: CGPoint(x: 12.71, y: 25.11), controlPoint1: CGPoint(x: 12.52, y: 25.55), controlPoint2: CGPoint(x: 12.62, y: 25.34))
        commentsPath.addCurve(to: CGPoint(x: 9.99, y: 22.57), controlPoint1: CGPoint(x: 11.56, y: 24.42), controlPoint2: CGPoint(x: 10.65, y: 23.57))
        commentsPath.addCurve(to: CGPoint(x: 9, y: 19.35), controlPoint1: CGPoint(x: 9.33, y: 21.56), controlPoint2: CGPoint(x: 9, y: 20.49))
        commentsPath.addCurve(to: CGPoint(x: 10.31, y: 15.66), controlPoint1: CGPoint(x: 9, y: 18.02), controlPoint2: CGPoint(x: 9.44, y: 16.79))
        commentsPath.addCurve(to: CGPoint(x: 13.89, y: 12.98), controlPoint1: CGPoint(x: 11.19, y: 14.53), controlPoint2: CGPoint(x: 12.38, y: 13.64))
        commentsPath.addCurve(to: CGPoint(x: 18.82, y: 12), controlPoint1: CGPoint(x: 15.4, y: 12.33), controlPoint2: CGPoint(x: 17.05, y: 12))
        commentsPath.close()
        commentsPath.move(to: CGPoint(x: 18.82, y: 13.84))
        commentsPath.addCurve(to: CGPoint(x: 14.83, y: 14.58), controlPoint1: CGPoint(x: 17.4, y: 13.84), controlPoint2: CGPoint(x: 16.07, y: 14.09))
        commentsPath.addCurve(to: CGPoint(x: 11.88, y: 16.61), controlPoint1: CGPoint(x: 13.59, y: 15.08), controlPoint2: CGPoint(x: 12.61, y: 15.76))
        commentsPath.addCurve(to: CGPoint(x: 10.79, y: 19.35), controlPoint1: CGPoint(x: 11.15, y: 17.46), controlPoint2: CGPoint(x: 10.79, y: 18.37))
        commentsPath.addCurve(to: CGPoint(x: 11.52, y: 21.62), controlPoint1: CGPoint(x: 10.79, y: 20.14), controlPoint2: CGPoint(x: 11.03, y: 20.89))
        commentsPath.addCurve(to: CGPoint(x: 13.6, y: 23.52), controlPoint1: CGPoint(x: 12.02, y: 22.35), controlPoint2: CGPoint(x: 12.71, y: 22.98))
        commentsPath.addLine(to: CGPoint(x: 14.96, y: 24.32))
        commentsPath.addLine(to: CGPoint(x: 14.47, y: 25.53))
        commentsPath.addCurve(to: CGPoint(x: 15.33, y: 24.97), controlPoint1: CGPoint(x: 14.79, y: 25.33), controlPoint2: CGPoint(x: 15.07, y: 25.15))
        commentsPath.addLine(to: CGPoint(x: 15.95, y: 24.52))
        commentsPath.addLine(to: CGPoint(x: 16.69, y: 24.66))
        commentsPath.addCurve(to: CGPoint(x: 18.82, y: 24.86), controlPoint1: CGPoint(x: 17.41, y: 24.8), controlPoint2: CGPoint(x: 18.12, y: 24.86))
        commentsPath.addCurve(to: CGPoint(x: 22.81, y: 24.12), controlPoint1: CGPoint(x: 20.24, y: 24.86), controlPoint2: CGPoint(x: 21.57, y: 24.62))
        commentsPath.addCurve(to: CGPoint(x: 25.76, y: 22.09), controlPoint1: CGPoint(x: 24.05, y: 23.62), controlPoint2: CGPoint(x: 25.03, y: 22.95))
        commentsPath.addCurve(to: CGPoint(x: 26.86, y: 19.35), controlPoint1: CGPoint(x: 26.49, y: 21.24), controlPoint2: CGPoint(x: 26.86, y: 20.33))
        commentsPath.addCurve(to: CGPoint(x: 25.76, y: 16.61), controlPoint1: CGPoint(x: 26.86, y: 18.37), controlPoint2: CGPoint(x: 26.49, y: 17.46))
        commentsPath.addCurve(to: CGPoint(x: 22.81, y: 14.58), controlPoint1: CGPoint(x: 25.03, y: 15.76), controlPoint2: CGPoint(x: 24.05, y: 15.08))
        commentsPath.addCurve(to: CGPoint(x: 18.82, y: 13.84), controlPoint1: CGPoint(x: 21.57, y: 14.09), controlPoint2: CGPoint(x: 20.24, y: 13.84))
        commentsPath.close()
        strokeColor.setStroke()
        commentsPath.lineWidth = 1
        commentsPath.stroke()

        let layer = CAShapeLayer()
        layer.path = commentsPath.cgPath
        layer.fillColor = fillColor.cgColor
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 1
        
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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.3, alpha: 1.0)
        label.text = "123"
        label.frame = CGRect(x: 42, y: 11, width: 41, height: 21)
        label.font = UIFont.systemFont(ofSize: 13.0)
        
        return label
    }()
    
    private func addLayers() {
        [borderLayer, commentsIconLayer].forEach { layer.addSublayer($0) }
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
          commentsIconLayer
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
}
