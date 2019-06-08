//
//  ViperViewController.swift
//  Vanilla
//
//  ViperViewController is essentially a mere UIViewController
//  which hides boilerplate ModuleViewWithOutput protocol code
//  and overrides prepare(for segue) func.
//
//  This is a base class for UIViewController instances which
//  implement VIPER and it should not be edited.
//
//  Created by Anton Krylov on 6/5/17.
//  Copyright © 2017 BrightBox. All rights reserved.
//

/// IMPORTANT:
/// THIS .swift FILE SHOULD NOT BE CHANGED OR UPDATED!
/// ANY MODIFICATIONS CAN LEAD TO LOSS OF INTEGRITY!

import UIKit

public protocol ModuleViewWithOutput {
    var presenter: ViperModuleInputProtocol { get }
}

public protocol ViperViewControllerProtocol: ModuleViewWithOutput {
    associatedtype OutputType
    var output: OutputType! { get set }
}

open class ViperViewController: UIViewController {
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
}

open class ViperTableViewController: UITableViewController {
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
}

open class ViperCollectionViewController: UICollectionViewController {
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.handleSegue(segue, sender: sender)
    }
}

class ViperNavigationController: UINavigationController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        handleSegue(segue, sender: sender)
    }
}

public extension ViperViewControllerProtocol where Self: UIViewController {
    var presenter: ViperModuleInputProtocol {
        guard let output = output as? ViperModuleInputProtocol else {
            fatalError("Presenter should conform 'ViperModuleInputProtocol'")
        }

        return output
    }
}

extension ViperViewController: ViperModuleTransitionHandler {}
extension ViperNavigationController: ViperModuleTransitionHandler {}
extension ViperTableViewController: ViperModuleTransitionHandler {}
extension ViperCollectionViewController: ViperModuleTransitionHandler {}
