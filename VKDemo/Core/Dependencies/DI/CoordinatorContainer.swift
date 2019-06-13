//
//  CoordinatorContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol CoordinatorContainerProtocol {
    var mainTabBarCoordinator: IMainTabBarCoordinator { get }
}

class CoordinatorContainer: CoordinatorContainerProtocol {
    private let serviceContainer = ServiceContainer()
    
    init() {
        let mainTabBarCoordinator = MainTabBarCoordinator()
        serviceContainer.add(services: mainTabBarCoordinator)
    }
    
    var mainTabBarCoordinator: IMainTabBarCoordinator {
        return serviceContainer.get(service: MainTabBarCoordinator.self) as! IMainTabBarCoordinator
    }
    
}
