//
//  AppCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 24/04/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift

protocol IAppCoordinator {
    func start() -> Observable<Void>
}

class AppCoordinator: BaseCoordinator<Void>, IAppCoordinator {
    
    private let window: UIWindow
    private let mainCoordinator = DI.container.coordinator.mainTabBarCoordinator
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() -> Observable<Void> {
        // Если нет пользака
        let welcomeCoordinator = WelcomeCoordinator(window: window)
        let observable = coordinate(to: welcomeCoordinator)
        
        _ = observable.subscribe({ event in
            let mainCoordinator = MainTabBarCoordinator()
            mainCoordinator.start()
        })
        
        return .never()
        
        // Если есть пользак, сразу переход в MainTabBarCoordinator,
        // который не реактивный
    }
}
