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
    
    // Input
    let didReceiveServerRedirectForProvisionalNavigation: AnyObserver< String>
//    let observable: Observable<String>
    
    // Output
//    let authorize: Observable<Void>

    init() {
        didReceiveServerRedirectForProvisionalNavigation = AnyObserver(eventHandler: { event in
            switch event {
            case .next(let urlString):
                print("Horaaaaay!\n\n")
                print(urlString)
                break
            default:
                print("wowowowowo")
                print(event)
                break
            }
        })
    }
}
