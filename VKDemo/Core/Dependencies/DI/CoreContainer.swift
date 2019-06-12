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
    private let serviceContainer = ServiceContainer()
    let dao: DaoContainerProtocol

    init(dao: DaoContainerProtocol) {
        self.dao = dao
        
        let sessionManager = UserSessionManager(sessionDao: dao.sessionDao)
        serviceContainer.add(services: sessionManager)
    }
    
    var sessionManager: UserSessionManager {
        return serviceContainer.get(service: UserSessionManager.self)!
    }
}
