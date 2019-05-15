//
//  AuthViewController.swift
//  VKDemo
//
//  Created by Anton Krylov on 13/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var vkLogoView: VkLogoView!
    @IBOutlet weak var logoViewCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var enterButton: VkEnterButton!
    
    var viewModel: AuthViewModel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startWelcomeAnimation()
    }
    
    private func startWelcomeAnimation() {
        logoViewCenterYConstraint.constant = -150
        
        UIView.animate(withDuration: 1.0, animations: {
            self.vkLogoView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.view.layoutIfNeeded()
        }) { completed in
//            self.enterButton.isEnabled = true
        }
    }
}
