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
    
    private var window: UIWindow {
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else {
            fatalError("No UIWindow found!")
        }
        return window
    }
    
    private lazy var mainCoordinator = DI.container.coordinator.mainTabBarCoordinator
    
    override func start() -> Observable<Void> {
        // Если нет пользака
        let welcomeCoordinator = WelcomeCoordinator(window: window)
        let observable = coordinate(to: welcomeCoordinator)
        
//        Вернуть когда понадобится авторизация
//        _ = observable.subscribe({ event in
//            let mainCoordinator = MainTabBarCoordinator()
//            mainCoordinator.start()
//        })
//
        
//      Вернуть когда НЕ НУЖНА авторизация
        let mainCoordinator = MainTabBarCoordinator()
        mainCoordinator.start()
//
        
        return .never()
        
        // Если есть пользак, сразу переход в MainTabBarCoordinator,
        // который не реактивный
    }
}
