//
//  MainTabBarCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 08/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

protocol IMainTabBarCoordinator {
    func start()
}

class MainTabBarCoordinator {
}

extension MainTabBarCoordinator: IMainTabBarCoordinator {
    func start() {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            return
        }
        
        let tabBarController = UITabBarController()
        let feedVC = FeedRouter().createModule()
        let chatVC = ChatRouter().createModule()
        
        feedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        chatVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        let controllers = [feedVC, chatVC]
        
        tabBarController.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
        window.rootViewController = tabBarController
    }
}
