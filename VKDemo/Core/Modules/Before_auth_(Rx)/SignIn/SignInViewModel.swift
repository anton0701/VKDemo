//
//  SignInViewModel.swift
//  VKDemo
//
//  Created by Anton Krylov on 27/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import WebKit

class SignInViewModel {
    
    private let sessionManager: UserSessionManager
    
    // Input
    let decidePolicyNavigationActionObserver: AnyObserver<URL>
    
    // Output
    let authorized: Observable<SignInCoordinationResult>

    init(sessionManager: UserSessionManager) {
        
        let _authorized = PublishSubject<SignInCoordinationResult>()
        authorized = _authorized.asObservable()
        
        decidePolicyNavigationActionObserver = AnyObserver(eventHandler: { event in
            switch event {
            case .next(let url):
                guard let parametersSubstring = url.absoluteString.split(separator: "#").last else { return }
                let parametersComponents = parametersSubstring.split(separator: "&")
                var parametersDict = [String: String]()
                
                parametersComponents.forEach({ substring in
                    let keyValueArray = substring.split(separator: "=")
                    parametersDict[String(keyValueArray[0])] = String(keyValueArray[1])
                })
                
                sessionManager.saveAccessToken(parametersDict["access_token"])
                _authorized.onNext(.success)
                break
            default:
                break
            }
        })
        
        self.sessionManager = sessionManager
    }
}
