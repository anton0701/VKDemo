//
//  SignInViewController.swift
//  VKDemo
//
//  Created by Anton Krylov on 27/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import WebKit
import RxWebKit

class SignInViewController: UIViewController {
    var viewModel: SignInViewModel!
    private let disposeBag = DisposeBag()
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=5513701&display=mobile&redirect_uri=https://oauth.vk.com/blank.html&scope=friends&response_type=token&v=5.95&state=123456") else {
            return
        }
        
        webView.load(URLRequest(url: url))
        
        webView.rx
            .decidePolicyNavigationAction
            .asObservable()
            .do(onNext: { webView, action, handler in
                handler(.allow)
            }, onError: { _ in
                print("22")
            }, onCompleted: {
                print("11")
            })
            .flatMap({ _, action, handler -> Observable<URL?> in
                return Observable.just(action.request.url)
            })
            .bind(to: viewModel.decidePolicyNavigationActionObserver)
            .disposed(by: disposeBag)
    }
}
