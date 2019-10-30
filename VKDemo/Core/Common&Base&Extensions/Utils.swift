//
//  Utils.swift
//  VKDemo
//
//  Created by Anton Krylov on 30.10.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

public struct Utils {
  public static func pathForCircleThatContains(rect: CGRect) -> CGPath {
    let size = rect.smallestContainingSquare
                   .size
                   .rescale(sqrt(2))
    return UIBezierPath(ovalIn: CGRect(centre: rect.centre, size: size)).cgPath
  }
  
    public static func pathForCircleInRect(rect: CGRect, scaled: CGFloat) -> CGPath {
    let size = rect.size.rescale(scaled)
    
    return UIBezierPath(ovalIn: CGRect(centre: rect.centre, size: size)).cgPath
  }
}
