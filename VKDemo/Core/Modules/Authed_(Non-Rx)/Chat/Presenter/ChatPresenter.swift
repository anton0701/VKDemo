//
//  ChatPresenter.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

class ChatPresenter {
    private weak var view: ChatViewInput?
    private let router: ChatRouterInput

    init(view: ChatViewInput, router: ChatRouterInput) {
        self.view = view
        self.router = router
    }
}

extension ChatPresenter: ChatViewOutput {
    func viewLoaded() {

    }
}
