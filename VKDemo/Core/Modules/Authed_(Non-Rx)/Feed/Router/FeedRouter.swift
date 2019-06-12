//
//  FeedRouter.swift
//  VKDemo
//
//  Created by AntonKrylovBrightBox on 10/06/2019.
//  Copyright © 2019 BrightBox. All rights reserved.
//

import UIKit

class FeedRouter {
    private weak var transitionHandler: ViperModuleTransitionHandler?

    func createModule() -> UIViewController {
        let vc = FeedViewController.loadFromXib()

        transitionHandler = vc

        let presenter = FeedPresenter(view: vc,
                                      router: self,
                                      feedManager: DI.container.data.feedManager)

        vc.presenter = presenter

        return vc
    }

    func openModule(with transitionHandler: ViperModuleTransitionHandler, transitionStyle: TransitionStyle) {
        transitionHandler.openModule(vc: createModule(), style: transitionStyle)
    }
}

extension FeedRouter: FeedRouterInput {

}
