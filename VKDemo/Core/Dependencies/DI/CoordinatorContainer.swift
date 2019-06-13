//
//  CoordinatorContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol CoordinatorContainerProtocol {
    var appCoordinator: IAppCoordinator { get }
    var mainTabBarCoordinator: IMainTabBarCoordinator { get }
}

class CoordinatorContainer {
    private let serviceContainer = ServiceContainer()
    
    init() {
        let mainTabBarCoordinator = MainTabBarCoordinator()
        serviceContainer.add(services: mainTabBarCoordinator)
        
        let appCoordinator = AppCoordinator()
        serviceContainer.add(services: appCoordinator)
    }
}

extension CoordinatorContainer: CoordinatorContainerProtocol {
    var mainTabBarCoordinator: IMainTabBarCoordinator {
        return serviceContainer.get(service: MainTabBarCoordinator.self)!
    }
    
    var appCoordinator: IAppCoordinator {
        return serviceContainer.get(service: AppCoordinator.self)!
    }
}
