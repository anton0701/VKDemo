//
//  WelcomeCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 08/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxWebKit
import WebKit
import SafariServices

class WelcomeCoordinator: BaseCoordinator<Void> {
    private let window: UIWindow
    
    // Input
    private var didAuthorized: AnyObserver<SignInCoordinationResult>?
    
    // Output
    private var authorized: Observable<SignInCoordinationResult>?
    
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
                guard let rootVC = self?.window.rootViewController else { return }
                _ = self?.showSignInVC(on: rootVC)
            })
            .disposed(by: disposeBag)
        
        return Observable.never()
    }
    
    private func showSignInVC(on rootViewController: UIViewController) -> Observable<SignInCoordinationResult> {
        let signInCoordinator = SignInCoordinator(rootViewController: rootViewController)
        
        return coordinate(to: signInCoordinator)
    }
}
