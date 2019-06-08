//
//  ViperModuleInitializer.swift
//  Vanilla
//
//  Created by Anton Krylov on 12/7/17.
//  Copyright © 2017 BrightBox. All rights reserved.
//

import Foundation
import UIKit

//TODO: remove ViperModuleInitializer protocol after deleting storyboards
public protocol ViperModuleInitializer: class {
    var viewController: UIViewController? { get }
}

public protocol ViperInitializer: class {
    func createModule(values: [Any])
}

public extension ViperModuleInitializer where Self: NSObject {
    public static func assemble(values: Any...) -> Self {
        let instance = Self.init()
        if let instance = instance as? ViperInitializer {
            instance.createModule(values: values)
        } else {
            instance.awakeFromNib()
        }

        return instance
    }

    public var viewController: UIViewController? {
        return value(forKey: "viewController") as? UIViewController
    }
}
