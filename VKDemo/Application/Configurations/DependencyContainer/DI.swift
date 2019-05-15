//
//  DI.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

class DI {
    private static let shared = DI()
    
    static var container: DIContainerProtocol {
        return shared.container
    }
    
    private let container: DIContainerProtocol
    
    init() {
        container = DIContainer()
    }
}
