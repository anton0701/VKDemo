//
//  AuthCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxWebKit
import WebKit
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
        let signInVC = SignInViewController()
        let signInVM = SignInViewModel()
        signInVC.viewModel = signInVM
        
        navigationController.pushViewController(signInVC, animated: true)
    }
}

