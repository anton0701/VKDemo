//
//  UIBezierPath+MyPaths.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/08/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

private let fillColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)

//extension UIBezierPath {
//    static func heartPath(frame: CGRect, fillColor: UIColor = fillColor, strokeColor: UIColor = blueMain) -> UIBezierPath {
//        /*
//        let bezierPath = UIBezierPath()
//        bezierPath.move(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.98298 * frame.height))
//        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.43192 * frame.width, y: frame.minY + 0.90900 * frame.height))
//        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.01373 * frame.width, y: frame.minY + 0.30128 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.17906 * frame.width, y: frame.minY + 0.66591 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.01373 * frame.width, y: frame.minY + 0.50209 * frame.height))
//        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.28118 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.01373 * frame.width, y: frame.minY + 0.13747 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.13043 * frame.width, y: frame.minY + 0.01064 * frame.height))
//        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.12161 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.36384 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.44651 * frame.width, y: frame.minY + 0.05291 * frame.height))
//        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.71882 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.55349 * frame.width, y: frame.minY + 0.05291 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.63616 * frame.width, y: frame.minY + 0.01064 * frame.height))
//        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.98627 * frame.width, y: frame.minY + 0.30128 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.86957 * frame.width, y: frame.minY + 0.01064 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.98627 * frame.width, y: frame.minY + 0.13747 * frame.height))
//        bezierPath.addCurve(to: CGPoint(x: frame.minX + 0.56808 * frame.width, y: frame.minY + 0.90900 * frame.height), controlPoint1: CGPoint(x: frame.minX + 0.98627 * frame.width, y: frame.minY + 0.50209 * frame.height), controlPoint2: CGPoint(x: frame.minX + 0.82094 * frame.width, y: frame.minY + 0.66591 * frame.height))
//        bezierPath.addLine(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.98298 * frame.height))
//
//        bezierPath.close()
//        fillColor.setFill()
//        bezierPath.fill()
//        strokeColor.setStroke()
//        bezierPath.lineWidth = 8
//        bezierPath.stroke()
//        */
//        
//    }
//}
