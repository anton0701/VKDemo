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
}
