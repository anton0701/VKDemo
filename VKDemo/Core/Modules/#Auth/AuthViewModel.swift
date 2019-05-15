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
    
    let showSignInScreen: AnyObserver<Void>
    
    init() {
//        let _chooseLanguage = PublishSubject<Void>()
//        self.chooseLanguage = _chooseLanguage.asObserver()
//        self.showLanguageList = _chooseLanguage.asObservable()

        let _showSignInScreen = PublishSubject<Void>()
        self.showSignInScreen = _showSignInScreen.asObserver()
    }
}
