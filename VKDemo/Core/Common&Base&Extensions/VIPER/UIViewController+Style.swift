//
//  UIViewController+Style.swift
//  Vanilla
//
//  Created by Alexander on 06.08.2018.
//  Copyright © 2018 BrightBox. All rights reserved.
//

import UIKit

enum BarStyle {
    case standard
    case standardNoSeparator
    case translucent // With gradient
    case transparent
    case hidden
    case standardLargeTitles
}

extension UIViewController {

    @available(*, deprecated, message: "Use setNavBarStyle(_ style: BarStyle) from BaseViewController superclass instead")
    func setBarStyle(_ style: BarStyle) {
        navigationItem.backBarButtonItem?.title = ""

        switch style {
        case .standard:
            navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.backgroundColor = UIColor.blueMain
            navigationController?.navigationBar.barTintColor = UIColor.blueMain
            setSeparatorHidden(false)
            setLargeTitlesEnabled(false)
        case .standardNoSeparator:
            navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.backgroundColor = UIColor.blueMain
            navigationController?.navigationBar.barTintColor = UIColor.blueMain
            setSeparatorHidden(true)
            setLargeTitlesEnabled(false)
        case .translucent:
            navigationController?.isNavigationBarHidden = true
        case .transparent:
            navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.backgroundColor = .clear
            navigationController?.navigationBar.barTintColor = .clear
            setSeparatorHidden(true)
        case .hidden:
            navigationController?.isNavigationBarHidden = true
        case .standardLargeTitles:
            navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.backgroundColor = UIColor.blueMain
            navigationController?.navigationBar.barTintColor = UIColor.blueMain
            setSeparatorHidden(false)
            setLargeTitlesEnabled(true)
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

    func setBarTitle(_ title: String?) {
        navigationItem.title = title
    }

    func setSeparatorHidden(_ hidden: Bool) {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.shadowImage = (hidden ? UIImage() : nil)
        } else {
            navigationController?.navigationBar.shadowImage = (hidden ? UIImage() : nil)
            navigationController?.navigationBar.setBackgroundImage((hidden ? UIImage() : nil), for: .default)
        }
    }
}
