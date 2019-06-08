//
//  ViperModuleTransitionHandler.swift
//  Vanilla
//
//  Created by Anton Krylov on 10/05/2017.
//  Copyright © 2017 BrightBox. All rights reserved.
//

import UIKit

public enum TransitionStyle {
    case push
    case modal
    case fade
}

public typealias ConfigurationBlock = (ViperModuleInputProtocol) -> Void

public protocol ViperModuleTransitionHandler: class {
    func openModule(segueIdentifier: String, configurationBlock: @escaping ConfigurationBlock)
    func openModule(segueIdentifier: String, source: ViperModuleOutputProtocol)
    func openModule(segueIdentifier: String)
    func openModule(vc: UIViewController, style: TransitionStyle, completion: (() -> Swift.Void)?)
    func openModule(transitionHandler: ViperModuleTransitionHandler, style: TransitionStyle)
    func closeModule()
    func popModule()
    func popToRootViewController()
    func swapAndPopToRootViewController(vc: UIViewController)
    func swapToViewController(vc: UIViewController)
}

extension ViperModuleTransitionHandler {
    func openModule(vc: UIViewController, style: TransitionStyle, completion: (() -> Swift.Void)? = nil) {
        self.openModule(vc: vc, style: style, completion: completion)
    }
}

public extension ViperModuleTransitionHandler where Self: UIViewController {
    func openModule(segueIdentifier: String, configurationBlock: @escaping ConfigurationBlock) {
        performSegue(withIdentifier: segueIdentifier, sender: configurationBlock)
    }

    func openModule(segueIdentifier: String, source: ViperModuleOutputProtocol) {
        performSegue(withIdentifier: segueIdentifier, sender: source)
    }

    func openModule(segueIdentifier: String) {
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }

    func openModule(vc: UIViewController, style: TransitionStyle, completion: (() -> Swift.Void)? = nil) {
        switch style {
        case .modal:
            self.present(vc, animated: true, completion: completion)
        case .push:
            self.navigationController?.pushViewController(vc, animated: true)
            defer {
                completion?()
            }
        case .fade:
            vc.modalTransitionStyle = .crossDissolve
            if let nc = self.navigationController {
                nc.present(vc, animated: true, completion: completion)
            } else {
                self.present(vc, animated: true, completion: completion)
            }
        }
    }

    func openModule(transitionHandler: ViperModuleTransitionHandler, style: TransitionStyle) {
        guard let vc = transitionHandler as? UIViewController else {
            return
        }

        switch style {
        case .modal:
            self.present(vc, animated: true, completion: nil)
        case .push:
            self.navigationController?.pushViewController(vc, animated: true)
        case .fade:
            vc.modalTransitionStyle = .crossDissolve
            self.present(vc, animated: true, completion: nil)
        }
    }

    //TODO: Подумать как сохранять TransitionStyle и уходить с экрана соответственно
    func closeModule() {
        if presentingViewController != nil {
            dismiss(animated: true, completion: nil)
        } else {
            let animated = presentedViewController == nil
            navigationController?.popToRootViewController(animated: animated)
        }
    }

    func popModule() {
        self.navigationController?.popViewController(animated: true)
    }

    func popToRootViewController() {
        self.navigationController?.popToRootViewController(animated: true)
    }

    func swapAndPopToRootViewController(vc: UIViewController) {
        self.navigationController?.viewControllers = [vc]
        self.navigationController?.popToRootViewController(animated: true)
    }

    func swapToViewController(vc: UIViewController) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            if let count = self.navigationController?.viewControllers.count,
                count > 1 {
                self.navigationController?.viewControllers.remove(at: count - 2)
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
        CATransaction.commit()
    }

    func handleSegue(_ segue: UIStoryboardSegue, sender: Any?) {
        if sender == nil {
            return
        }

        guard let configurationHolder = segue.destination as? ModuleViewWithOutput else {
            fatalError("Destination should conform 'ModuleViewWithOutput'")
        }

        if let source = sender as? ViperModuleOutputProtocol {
            configurationHolder.presenter.output = source
        } else if let configure = sender as? ConfigurationBlock {
            configure(configurationHolder.presenter)
        }
    }
}
