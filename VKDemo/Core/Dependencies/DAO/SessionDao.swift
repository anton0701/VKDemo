//
//  SessionDao.swift
//  VKDemo
//
//  Created by Anton Krylov on 31/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol ISessionDao {
    
    func saveAccessToken(_ accessToken: String?)
    func getAccessToken() -> String?
}

class SessionDao {
    
    private lazy var userDefaults = UserDefaults.standard
    private lazy var accessTokenKey = "accessToken"
}

extension SessionDao: ISessionDao {
    
    func saveAccessToken(_ accessToken: String?) {
        userDefaults.set(accessToken, forKey: accessTokenKey)
    }
    
    func getAccessToken() -> String? {
        return userDefaults.object(forKey: accessTokenKey) as? String
    }
}
