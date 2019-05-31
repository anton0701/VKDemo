//
//  IUserSessionManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 28/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//f

import Foundation

protocol IUserSessionManager {
    func clearSession()
    
    func getAccessToken() -> String?
    
    func saveAccessToken(_ accessToken: String?)
}
