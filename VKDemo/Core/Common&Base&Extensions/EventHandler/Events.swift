//
//  Events.swift
//  VKDemo
//
//  Created by Anton Krylov on 08.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

class Events<T> {
    typealias EventHandler = (T) -> Void

    private var eventHandlers = [EventHandler]()

    func addHandler(_ handler: @escaping EventHandler) {
        eventHandlers.append(handler)
    }

    func raise(_ data: T) {
        for handler in eventHandlers {
            handler(data)
        }
    }

    func clearHandlers() {
        eventHandlers.removeAll()
    }
}
