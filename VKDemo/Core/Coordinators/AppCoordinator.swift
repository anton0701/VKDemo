//
//  AppCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 24/04/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() -> Observable<Void> {
        let authCoordinator = AuthCoordinator(window: window)
        return coordinate(to: authCoordinator)
    }
}
