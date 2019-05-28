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
    let decidePolicyNavigationActionObserver: AnyObserver< URL?>
    
    // Output
//    let authorize: Observable<Void>

    init() {
        decidePolicyNavigationActionObserver = AnyObserver(eventHandler: { event in
            switch event {
            case .next(let url):
                guard let url = url,
                    url.absoluteString.contains("#"),
                    let parametersSubstring = url.absoluteString.split(separator: "#").last else { return }
                
                let parametersComponents = parametersSubstring.split(separator: "&")
                var parametersDict = [String: String]()
                
                parametersComponents.forEach({ substring in
                    let keyValueArray = substring.split(separator: "=")
                    parametersDict[String(keyValueArray[0])] = String(keyValueArray[1])
                })
                
                print(parametersDict)
                print(url)
                break
            default:
                print("wowowowowo")
                print(event)
                break
            }
        })
    }
}
