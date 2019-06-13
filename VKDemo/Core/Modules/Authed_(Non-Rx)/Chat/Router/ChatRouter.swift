//
//  ChatRouter.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

class ChatRouter {
    private weak var transitionHandler: ViperModuleTransitionHandler?

    func createModule() -> UIViewController {
        let vc = ChatViewController.loadFromXib()

        transitionHandler = vc

        let presenter = ChatPresenter(view: vc, router: self)

        vc.presenter = presenter
        vc.title = "Chat"
        vc.view.backgroundColor = UIColor.blue
        
        return vc
    }

    func openModule(with transitionHandler: ViperModuleTransitionHandler, transitionStyle: TransitionStyle) {
        transitionHandler.openModule(vc: createModule(), style: transitionStyle)
    }
}

extension ChatRouter: ChatRouterInput {

}
