//
//  UserSessionManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 28/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

class UserSessionManager {
    
    private let userDao: IUserDao
    
    private var accessToken: String?
    
    init(userDao: IUserDao) {
        self.userDao = userDao
    }
}

extension UserSessionManager: IUserSessionManager {
    func clearSession() {
        accessToken = nil
        userDao.saveAccessToken(nil)
    }
    
    
    func getAccessToken() -> String? {
        return accessToken ?? userDao.getAccessToken()
    }
    
    func saveAccessToken(_ accessToken: String?) {
        self.accessToken = accessToken
        userDao.saveAccessToken(accessToken)
    }
}
