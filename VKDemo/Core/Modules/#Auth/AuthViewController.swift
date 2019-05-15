//
//  AuthViewController.swift
//  VKDemo
//
//  Created by Anton Krylov on 13/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class AuthViewController: UIViewController {
    
    @IBOutlet weak var vkLogoView: VkLogoView!
    @IBOutlet weak var logoViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var enterButton: VkEnterButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: AuthViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startWelcomeAnimation()
    }
    
    private func setupBindings() {
        enterButton.rx
            .tap
            .bind(to: viewModel.showSignInScreen)
            .disposed(by: disposeBag)
        
        emailTextField.rx
            .controlEvent(.allTouchEvents)
            .bind(to: viewModel.showSignInScreen)
            .disposed(by: disposeBag)
        
        passwordTextField.rx
            .controlEvent(.allTouchEvents)
            .bind(to: viewModel.showSignInScreen)
            .disposed(by: disposeBag)
    }
    
    private func startWelcomeAnimation() {
        logoViewCenterYConstraint.constant = -150
        
        UIView.animate(withDuration: 1.0, animations: {
            self.vkLogoView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.view.layoutIfNeeded()
        }) { completed in
            self.enterButton.isEnabled = true
        }
    }
}
