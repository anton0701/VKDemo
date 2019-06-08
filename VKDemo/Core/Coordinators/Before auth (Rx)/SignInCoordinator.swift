//
//  SignInCoordinator.swift
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

enum SignInCoordinationResult {
    case success
    case fail
}

class SignInCoordinator: BaseCoordinator<SignInCoordinationResult> {
    private let rootViewController: UIViewController
    
    // Input
    private var didAuthorized: AnyObserver<SignInCoordinationResult>?
    
    // Output
    private var authorized: Observable<SignInCoordinationResult>?
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        super.init()
    }

    override func start() -> Observable<SignInCoordinationResult> {
        
        let signInVC = SignInViewController()
        let signInVM = SignInViewModel(sessionManager: DI.container.core.sessionManager)
        signInVC.viewModel = signInVM
        
        guard let navC = rootViewController as? UINavigationController else {
            fatalError("123!!!")
        }
        navC.pushViewController(signInVC, animated: true)
        
        return signInVM.authorized
    }
}

