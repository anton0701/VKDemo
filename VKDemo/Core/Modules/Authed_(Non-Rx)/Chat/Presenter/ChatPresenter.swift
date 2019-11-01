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
    
    private let messagesManager: IMessagesManager

    init(view: ChatViewInput,
         router: ChatRouterInput,
         messagesManager: IMessagesManager) {
        self.view = view
        self.router = router
        self.messagesManager = messagesManager
    }
}

extension ChatPresenter: ChatViewOutput {
    func viewLoaded() {
        messagesManager.getConversations(success: { feedItem in
            
        }) { error in
            
        }
    }
}
