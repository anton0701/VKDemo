//
//  AppDelegate.swift
//  VKDemo
//
//  Created by Anton Krylov on 24/04/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import UIKit
import RxSwift

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let blueMain = UIColor(red: 0.294, green: 0.471, blue: 0.706, alpha: 1.000)
    private let redMain = UIColor(red: 1, green: 49/255, blue: 0/255, alpha: 1.000)

    var window: UIWindow?
    let disposeBag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard let window = window else {
            return true
        }
        
        setupAppearance()
        
        let appCoordinator = AppCoordinator(window: window)
        _ = appCoordinator.start().subscribe(onNext: { _ in
            let mainCoordinator = MainTabBarCoordinator()
            mainCoordinator.start()
        }).disposed(by: disposeBag)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    private func setupAppearance() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = blueMain
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
}
