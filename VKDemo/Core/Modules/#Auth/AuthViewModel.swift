//
//  AuthViewModel.swift
//  VKDemo
//
//  Created by Anton Krylov on 13/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import RxSwift

class AuthViewModel {
    
    // Input
    let showSignInScreen: AnyObserver<Void>
    
    // Output
    let authorize: Observable<Void>
    
    init() {
        let _showSignInScreen = PublishSubject<Void>()
        self.showSignInScreen = _showSignInScreen.asObserver()
        self.authorize = _showSignInScreen.asObservable()
    }
}
