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
        
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=5513701&display=mobile&scope=friends&response_type=token&v=5.95&state=123456") else {
            return
        }
        
        webView.load(URLRequest(url: url))
//        webView.rx
//            .didReceiveServerRedirectForProvisionalNavigation
//            .asObservable()
//            .subscribe(onNext: { webView, navigation in
//                print("111")
//            }).disposed(by: disposeBag)
        
        webView.rx
            .didReceiveServerRedirectForProvisionalNavigation
            .asObservable()
            .flatMap({ webView, navigation -> Observable<String> in
                return Observable.just(webView.url?.absoluteString ?? "")
            })
            .bind(to: viewModel.didReceiveServerRedirectForProvisionalNavigation)
            .disposed(by: disposeBag)
    }
}
