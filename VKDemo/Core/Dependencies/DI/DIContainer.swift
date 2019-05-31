//
//  DIContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol DIContainerProtocol {
    var core: CoreContainerProtocol { get }
    var data: DataContainerProtocol { get }
    var dao: DaoContainerProtocol { get }
    var presentation: PresentationContainerProtocol { get }
    var parse: ParseContainerProtocol { get }
    var config: ConfigContainerProtocol { get }
    var coordinator: CoordinatorContainerProtocol { get }
}

class DIContainer: DIContainerProtocol {
    
    internal var core: CoreContainerProtocol
    internal var data: DataContainerProtocol
    internal var dao: DaoContainerProtocol
    internal var presentation: PresentationContainerProtocol
    internal var parse: ParseContainerProtocol
    internal var config: ConfigContainerProtocol
    var coordinator: CoordinatorContainerProtocol
    
    init() {
        self.parse = ParseContainer()
        self.config = ConfigContainer()
        self.core = CoreContainer()
        self.dao = DaoContainer()
        self.presentation = PresentationContainer()
        self.data = DataContainer()
        self.coordinator = CoordinatorContainer()
    }
}
