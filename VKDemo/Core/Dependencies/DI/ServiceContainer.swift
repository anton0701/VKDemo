//
//  ServiceContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

class ServiceContainer {
    private lazy var container = [String: Any]()

    func add(services: Any...) {
        for service in services {
            container["\(type(of: service))"] = service
        }
    }

    func get<T>(service: T.Type) -> T? {
        return container["\(T.self)"] as? T
    }
}
