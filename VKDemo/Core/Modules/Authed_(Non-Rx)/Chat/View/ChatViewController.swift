//
//  ChatViewController.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

class ChatViewController: BaseViewController, ViperModuleTransitionHandler {
    var presenter: ChatViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewLoaded()
    }
}

extension ChatViewController: ChatViewInput {
    func setup() {

    }
}
