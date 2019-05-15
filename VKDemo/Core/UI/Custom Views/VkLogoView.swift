//
//  VkLogoView.swift
//  VKDemo
//
//  Created by Anton Krylov on 13/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit

private let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)

enum VkLogoViewShape {
    case rect
    case roundedRect
    case circle
    case star
}

enum VkLogoViewState {
    case normal
    case loading
    case success
    case fail
}

class VkLogoView: UIView {
    private var currentShape: VkLogoViewShape
    private var currentState: VkLogoViewState
    
    private let vkLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    
    init(radius: CGFloat, currentShape: VkLogoViewShape?, currentState: VkLogoViewState?) {
        self.currentShape = currentShape ?? .roundedRect
        self.currentState = currentState ?? .normal
        
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: 2*radius, height: 2*radius)))
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
    }

    // Сами буквы VK
    private func getVkPath(frame: CGRect) -> UIBezierPath {
        let vkPath = UIBezierPath()
        
        vkPath.move(to: CGPoint(x: frame.minX + 0.80737 * frame.width, y: frame.minY + 0.71355 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.73445 * frame.width, y: frame.minY + 0.71355 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.64906 * frame.width, y: frame.minY + 0.64193 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.70665 * frame.width, y: frame.minY + 0.71355 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.69849 * frame.width, y: frame.minY + 0.69136 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.57644 * frame.width, y: frame.minY + 0.59481 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.60579 * frame.width, y: frame.minY + 0.60021 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58725 * frame.width, y: frame.minY + 0.59481 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.61980 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56175 * frame.width, y: frame.minY + 0.59481 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.59896 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.68518 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.50529 * frame.width, y: frame.minY + 0.71355 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.70312 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55164 * frame.width, y: frame.minY + 0.71355 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.28289 * frame.width, y: frame.minY + 0.58013 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42803 * frame.width, y: frame.minY + 0.71355 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.34315 * frame.width, y: frame.minY + 0.66664 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.16779 * frame.width, y: frame.minY + 0.33833 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.19251 * frame.width, y: frame.minY + 0.45344 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.16779 * frame.width, y: frame.minY + 0.35764 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.19279 * frame.width, y: frame.minY + 0.31770 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.16779 * frame.width, y: frame.minY + 0.32752 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.17195 * frame.width, y: frame.minY + 0.31770 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.26571 * frame.width, y: frame.minY + 0.31770 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.29834 * frame.width, y: frame.minY + 0.34606 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.28434 * frame.width, y: frame.minY + 0.31770 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.29134 * frame.width, y: frame.minY + 0.32587 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.41885 * frame.width, y: frame.minY + 0.54074 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.33399 * frame.width, y: frame.minY + 0.44994 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.39414 * frame.width, y: frame.minY + 0.54074 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.43238 * frame.width, y: frame.minY + 0.51291 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42812 * frame.width, y: frame.minY + 0.54074 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.43238 * frame.width, y: frame.minY + 0.53645 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.43238 * frame.width, y: frame.minY + 0.40554 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.40339 * frame.width, y: frame.minY + 0.33447 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.42966 * frame.width, y: frame.minY + 0.35611 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40339 * frame.width, y: frame.minY + 0.35205 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.42196 * frame.width, y: frame.minY + 0.31770 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.40339 * frame.width, y: frame.minY + 0.32632 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.41036 * frame.width, y: frame.minY + 0.31770 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.53653 * frame.width, y: frame.minY + 0.31770 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.34451 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55199 * frame.width, y: frame.minY + 0.31770 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.32597 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.48897 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.56871 * frame.width, y: frame.minY + 0.50983 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55736 * frame.width, y: frame.minY + 0.50441 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.56408 * frame.width, y: frame.minY + 0.50983 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.60270 * frame.width, y: frame.minY + 0.48742 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.57798 * frame.width, y: frame.minY + 0.50983 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.58571 * frame.width, y: frame.minY + 0.50441 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.69231 * frame.width, y: frame.minY + 0.33833 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65523 * frame.width, y: frame.minY + 0.42871 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.69231 * frame.width, y: frame.minY + 0.33833 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.72403 * frame.width, y: frame.minY + 0.31770 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.69695 * frame.width, y: frame.minY + 0.32752 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.70550 * frame.width, y: frame.minY + 0.31770 * frame.height))
        vkPath.addLine(to: CGPoint(x: frame.minX + 0.79695 * frame.width, y: frame.minY + 0.31770 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.81900 * frame.width, y: frame.minY + 0.34451 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.81900 * frame.width, y: frame.minY + 0.31770 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.82364 * frame.width, y: frame.minY + 0.32907 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.72089 * frame.width, y: frame.minY + 0.51214 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80974 * frame.width, y: frame.minY + 0.38700 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.72089 * frame.width, y: frame.minY + 0.51214 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.72089 * frame.width, y: frame.minY + 0.54459 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.71316 * frame.width, y: frame.minY + 0.52451 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.71008 * frame.width, y: frame.minY + 0.53069 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.77110 * frame.width, y: frame.minY + 0.59712 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.72862 * frame.width, y: frame.minY + 0.55541 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.75411 * frame.width, y: frame.minY + 0.57703 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.83261 * frame.width, y: frame.minY + 0.68257 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.80243 * frame.width, y: frame.minY + 0.63235 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.82603 * frame.width, y: frame.minY + 0.66208 * frame.height))
        vkPath.addCurve(to: CGPoint(x: frame.minX + 0.80737 * frame.width, y: frame.minY + 0.71355 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.83862 * frame.width, y: frame.minY + 0.70312 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.82820 * frame.width, y: frame.minY + 0.71355 * frame.height))
        vkPath.close()
        
        return vkPath
    }
    
    // Фон
    private func getBackgroundPath(frame: CGRect) -> UIBezierPath {
        let backgroundPath = UIBezierPath()
        backgroundPath.move(to: CGPoint(x: frame.minX + 0.65333 * frame.width, y: frame.minY + 1.00000 * frame.height))
        backgroundPath.addLine(to: CGPoint(x: frame.minX + 0.34667 * frame.width, y: frame.minY + 1.00000 * frame.height))
        backgroundPath.addCurve(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.65333 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.06667 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.93333 * frame.height))
        backgroundPath.addLine(to: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.34666 * frame.height))
        backgroundPath.addCurve(to: CGPoint(x: frame.minX + 0.34667 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.00000 * frame.width, y: frame.minY + 0.06667 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.06667 * frame.width, y: frame.minY + 0.00000 * frame.height))
        backgroundPath.addLine(to: CGPoint(x: frame.minX + 0.65333 * frame.width, y: frame.minY + 0.00000 * frame.height))
        backgroundPath.addCurve(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.34666 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.93333 * frame.width, y: frame.minY + 0.00000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.06667 * frame.height))
        backgroundPath.addLine(to: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.65333 * frame.height))
        backgroundPath.addCurve(to: CGPoint(x: frame.minX + 0.65333 * frame.width, y: frame.minY + 1.00000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 1.00000 * frame.width, y: frame.minY + 0.93333 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.93333 * frame.width, y: frame.minY + 1.00000 * frame.height))
        fillColor.setFill()
        backgroundPath.fill()
        backgroundPath.usesEvenOddFillRule = true
        backgroundPath.close()
        
        return backgroundPath
    }
    
    private func getApplePath(frame: CGRect) -> UIBezierPath {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.62723 * frame.width, y: frame.minY + 0.51575 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.63882 * frame.width, y: frame.minY + 0.46806 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.62723 * frame.width, y: frame.minY + 0.49667 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63212 * frame.width, y: frame.minY + 0.48070 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.67766 * frame.width, y: frame.minY + 0.42550 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65323 * frame.width, y: frame.minY + 0.44021 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.67612 * frame.width, y: frame.minY + 0.42631 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.59226 * frame.width, y: frame.minY + 0.37806 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.65040 * frame.width, y: frame.minY + 0.38426 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.60795 * frame.width, y: frame.minY + 0.37885 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.50351 * frame.width, y: frame.minY + 0.40000 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55625 * frame.width, y: frame.minY + 0.37446 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.52178 * frame.width, y: frame.minY + 0.40000 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.42635 * frame.width, y: frame.minY + 0.37911 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.48523 * frame.width, y: frame.minY + 0.40000 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.45644 * frame.width, y: frame.minY + 0.37885 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.32989 * frame.width, y: frame.minY + 0.43892 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.38698 * frame.width, y: frame.minY + 0.38012 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.35046 * frame.width, y: frame.minY + 0.40284 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.31600 * frame.width, y: frame.minY + 0.47476 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.32345 * frame.width, y: frame.minY + 0.45001 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.31908 * frame.width, y: frame.minY + 0.46214 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.35973 * frame.width, y: frame.minY + 0.67842 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.29851 * frame.width, y: frame.minY + 0.54361 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.32602 * frame.width, y: frame.minY + 0.62843 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.43304 * frame.width, y: frame.minY + 0.73850 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.37902 * frame.width, y: frame.minY + 0.70705 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.40268 * frame.width, y: frame.minY + 0.73981 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.50943 * frame.width, y: frame.minY + 0.71915 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.46262 * frame.width, y: frame.minY + 0.73748 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.47369 * frame.width, y: frame.minY + 0.71915 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.58634 * frame.width, y: frame.minY + 0.73774 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.54518 * frame.width, y: frame.minY + 0.71915 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55497 * frame.width, y: frame.minY + 0.73850 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.65785 * frame.width, y: frame.minY + 0.67973 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.61823 * frame.width, y: frame.minY + 0.73748 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63829 * frame.width, y: frame.minY + 0.70834 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.69000 * frame.width, y: frame.minY + 0.61218 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68022 * frame.width, y: frame.minY + 0.64597 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.68925 * frame.width, y: frame.minY + 0.61374 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.62723 * frame.width, y: frame.minY + 0.51575 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.68925 * frame.width, y: frame.minY + 0.61168 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.62802 * frame.width, y: frame.minY + 0.58769 * frame.height))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: frame.minX + 0.56885 * frame.width, y: frame.minY + 0.33889 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.59329 * frame.width, y: frame.minY + 0.26333 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.58531 * frame.width, y: frame.minY + 0.31902 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.59587 * frame.width, y: frame.minY + 0.29091 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.52434 * frame.width, y: frame.minY + 0.29918 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.56962 * frame.width, y: frame.minY + 0.26410 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.54107 * frame.width, y: frame.minY + 0.27883 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.49991 * frame.width, y: frame.minY + 0.37293 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.50943 * frame.width, y: frame.minY + 0.31723 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.49630 * frame.width, y: frame.minY + 0.34534 * frame.height))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.56885 * frame.width, y: frame.minY + 0.33914 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.52564 * frame.width, y: frame.minY + 0.37472 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.55264 * frame.width, y: frame.minY + 0.35924 * frame.height))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.56885 * frame.width, y: frame.minY + 0.33889 * frame.height))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        blueMain.setFill()
        bezierPath.fill()
        blueMain.setStroke()
        bezierPath.lineWidth = 2.31
        bezierPath.stroke()
        
        return bezierPath
    }
    
    private func getDotPath(frame: CGRect) -> UIBezierPath {
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + fastFloor(frame.width * 0.33333 + 0.5), y: frame.minY + fastFloor(frame.height * 0.33333 + 0.5), width: fastFloor(frame.width * 0.66667 + 0.5) - fastFloor(frame.width * 0.33333 + 0.5), height: fastFloor(frame.height * 0.66667 + 0.5) - fastFloor(frame.height * 0.33333 + 0.5)))
        blueMain.setFill()
        ovalPath.fill()
        blueMain.setStroke()
        ovalPath.lineWidth = 10
        ovalPath.stroke()
        
        return ovalPath
    }

    required init?(coder aDecoder: NSCoder) {
        self.currentShape = .roundedRect
        self.currentState = .normal
        
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        let backgroundPath = getBackgroundPath(frame: rect)
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.fillColor = UIColor.white.cgColor
        layer.addSublayer(backgroundLayer)
        
        let vkPath = getVkPath(frame: rect)
        vkLayer.path = vkPath.cgPath
        vkLayer.fillColor = blueMain.cgColor
        layer.addSublayer(vkLayer)
    }
    
    func showAnimation() {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "path")
//        animation.fromValue = vkLayer.path
        animation.toValue = getDotPath(frame: frame)
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeForwards
        animation.autoreverses = true
        animation.repeatCount = 10
        vkLayer.add(animation, forKey: "pathAnimation")
    }
}
