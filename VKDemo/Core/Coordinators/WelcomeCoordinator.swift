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
    
    private let _authorizedSubject: PublishSubject<Void>
    private let authorizedObserver: AnyObserver<Void>
    private let authorizedObservable: Observable<Void>
    
    init(window: UIWindow) {
        self.window = window
        
        _authorizedSubject = PublishSubject<Void>()
        authorizedObserver = _authorizedSubject.asObserver()
        authorizedObservable = _authorizedSubject.asObservable()
        
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
                guard let `self` = self,
                    let rootVC = self.window.rootViewController else { return }
                
                let auth = self.showSignInVC(on: rootVC).share()
                    
                auth
                .filter({ signInResult -> Bool in
                    return signInResult == .success
                })
                .do(onNext: { _ in
                    self._authorizedSubject.onNext(Void())
                }).subscribe({ event in
                    print(event)
                    print("234234234 23")
                })
                
            })
            .disposed(by: disposeBag)
        
        return authorizedObservable
    }
    
    private func showSignInVC(on rootViewController: UIViewController) -> Observable<SignInCoordinationResult> {
        let signInCoordinator = SignInCoordinator(rootViewController: rootViewController)
        
        return coordinate(to: signInCoordinator)
    }
}
