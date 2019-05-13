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
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.transition(with: logoImageView,
                          duration: 0.5,
                          options: .transitionFlipFromLeft,
                          animations: {
            
        }) { completed in
            print("Completed 1: \(completed)")
        }
    
    }
}
