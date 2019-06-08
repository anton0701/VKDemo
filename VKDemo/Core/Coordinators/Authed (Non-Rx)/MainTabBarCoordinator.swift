//
//  MainTabBarCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 08/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarCoordinator {
    func start() {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            return
        }
        
//        let enterPinRouter = EnterPinRouter()
//
//        if !enterPinRouter.isModuleVisible() {
//            window.rootViewController = UINavigationController(rootViewController: EnterPinRouter().createModule(output: self))
//        }
    }
}
