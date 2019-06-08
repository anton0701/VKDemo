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
    
    // Input
    private var didAuthorized: AnyObserver<Void>?
    
    // Output
    private var authorized: Observable<Void>?
    
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
        
        let _authorizedSubject = PublishSubject<Void>()
        authorized = _authorizedSubject.asObservable()
        didAuthorized = _authorizedSubject.asObserver()
        
        return authorized!
    }
    
    private func showSignInVC(in navigationController: UINavigationController) {
        let signInVC = SignInViewController()
        let signInVM = SignInViewModel(sessionManager: DI.container.core.sessionManager)
        signInVC.viewModel = signInVM
        
        guard let didAuthorized = didAuthorized else { return }
        _ = signInVM.authorized.bind(to: didAuthorized)
        
        navigationController.pushViewController(signInVC, animated: true)
    }
}

