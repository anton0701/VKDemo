//
//  UserSessionManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 28/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

class UserSessionManager {
    
    private let sessionDao: ISessionDao
    
    private var accessToken: String?
    
    init(sessionDao: ISessionDao) {
        self.sessionDao = sessionDao
    }
}

extension UserSessionManager: IUserSessionManager {
    func clearSession() {
        accessToken = nil
        sessionDao.saveAccessToken(nil)
    }
    
    func getAccessToken() -> String? {
        return accessToken ?? sessionDao.getAccessToken()
    }
    
    func saveAccessToken(_ accessToken: String?) {
        self.accessToken = accessToken
        sessionDao.saveAccessToken(accessToken)
    }
}
