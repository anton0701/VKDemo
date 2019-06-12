//
//  DaoContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol DaoContainerProtocol {
    var sessionDao: ISessionDao { get }
}

class DaoContainer {
    
    private let serviceContainer = ServiceContainer()
    
    init() {
        let sessionDao = SessionDao()
        
        serviceContainer.add(services: sessionDao)
    }
}

extension DaoContainer: DaoContainerProtocol {
    var sessionDao: ISessionDao {
        return serviceContainer.get(service: SessionDao.self)!
    }
}
