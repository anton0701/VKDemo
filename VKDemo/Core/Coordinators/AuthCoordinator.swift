//
//  AuthCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift

enum AuthCoordinationResult {
    case success
}

class AuthCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    override func start() -> Observable<Void> {
        let authVc = AuthViewController.loadFromXib()
        let authVm = AuthViewModel()
        let navigationController = UINavigationController(rootViewController: authVc)
        authVc.viewModel = authVm
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return Observable.never()
    }
}

