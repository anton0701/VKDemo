//
//  CoreContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol CoreContainerProtocol {
    var sessionManager: UserSessionManager { get }
}

class CoreContainer: CoreContainerProtocol {
    let serviceContainer = ServiceContainer()

    init() {
        let userDao = UserDao()
        serviceContainer.add(services: userDao)
        
        let sessionManager = UserSessionManager(userDao: userDao)
        serviceContainer.add(services: sessionManager)
    }
    
    var sessionManager: UserSessionManager {
        return serviceContainer.get(service: UserSessionManager.self)!
    }
}
