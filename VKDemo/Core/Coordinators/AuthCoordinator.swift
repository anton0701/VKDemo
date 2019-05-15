//
//  AuthCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift
import SafariServices

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
        
        authVm.authorize
            .subscribe(onNext:{ [weak self] in
                self?.showSignInVC(in: navigationController)
            })
            .disposed(by: disposeBag)
        
        return Observable.never()
    }
    
    private func showSignInVC(in navigationController: UINavigationController) {
        let safariViewController = SFSafariViewController(url: URL(string: "https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.95&state=123456")!)
        navigationController.pushViewController(safariViewController, animated: true)
    }
}

