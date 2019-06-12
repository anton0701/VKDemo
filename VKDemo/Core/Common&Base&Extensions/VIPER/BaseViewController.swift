//
//  BaseViewController.swift
//  Vanilla
//
//  Created by Konstantin Ursul on 5/21/18.
//  Copyright © 2018 BrightBox. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardOnTappingAround()

        view.backgroundColor = UIColor.white
    }

    func setNavBarStyle(_ style: BarStyle) {
        navigationItem.backBarButtonItem?.title = ""

        switch style {
        case .standard:
            navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.backgroundColor = UIColor.blueMain
            navigationController?.navigationBar.barTintColor = UIColor.blueMain
            statusBarStyle = .default
            setLargeTitlesEnabled(false)
            setSeparatorHidden(false)
        case .standardNoSeparator:
            navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.backgroundColor = UIColor.blueMain
            navigationController?.navigationBar.barTintColor = UIColor.blueMain
            statusBarStyle = .default
            setLargeTitlesEnabled(false)
            setSeparatorHidden(true)
        case .translucent:
            navigationController?.isNavigationBarHidden = true
            statusBarStyle = .lightContent
        case .transparent:
            navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.backgroundColor = .clear
            navigationController?.navigationBar.barTintColor = .clear
            statusBarStyle = .lightContent
            setSeparatorHidden(true)
        case .hidden:
            navigationController?.isNavigationBarHidden = true
        case .standardLargeTitles:
            navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.backgroundColor = UIColor.blueMain
            navigationController?.navigationBar.barTintColor = UIColor.blueMain
            statusBarStyle = .default
            setLargeTitlesEnabled(true)
            setSeparatorHidden(false)
        }
        navigationController?.navigationBar.isExclusiveTouch = true
    }

    private func setLargeTitlesEnabled(_ enabled: Bool) {
        guard #available(iOS 11.0, *) else {
            return
        }

        if navigationController?.navigationBar.prefersLargeTitles == true {
            navigationItem.largeTitleDisplayMode = enabled ? .automatic : .never
        } else if enabled {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavBarStyle(.standard)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setInCallSafeFrame()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - Hide Keyboard When View Tapped
extension BaseViewController {
    private func hideKeyboardOnTappingAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Keyboard Show/Hide Observers (Subclassing)
extension BaseViewController {
    open func addKeyboardWillShowObserver(selector: Selector) {
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: .UIKeyboardWillShow,
                                               object: nil)
    }
    
    open func addKeyboardWillHideObserver(selector: Selector) {
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: .UIKeyboardWillHide,
                                               object: nil)
    }
    
    open func addKeyboardDidHideObserver(selector: Selector) {
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: .UIKeyboardDidHide,
                                               object: nil)
    }
}
