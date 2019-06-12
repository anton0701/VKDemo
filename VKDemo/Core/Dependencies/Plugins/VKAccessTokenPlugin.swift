//
//  VKAccessTokenPlugin.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Result
import Moya

public protocol VKAccessTokenAuthorizable {
    var authorizationType: VKAuthorizationType { get }
}

public enum VKAuthorizationType {
    case none
    case oauth
}

public struct VKAccessTokenPlugin: PluginType {
    
    let userSessionManager: IUserSessionManager
    
    init(userSessionManager: IUserSessionManager) {
        self.userSessionManager = userSessionManager
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
//         guard let authorizable = target as? VKAccessTokenAuthorizable else {
//            return request
//        }
//
//        var changedRequest = request
//
//        switch authorizable.authorizationType {
//        case .oauth:
//            guard let accessToken = userSessionManager.getAccessToken() else {
//                break
//            }
////            changedRequest.setValue(accessToken, forHTTPHeaderField: "access_token")
////            changedRequest.allHTTPHeaderFields?["access_token"] = accessToken
//            let accessTokenPathComponent = "access_token=\(accessToken)"
//            changedRequest.url?.appendPathComponent(accessTokenPathComponent)
//
//        default:
//            break
//        }
//
//        return changedRequest
        
        return request
    }
    
    public func willSend(_ request: RequestType, target: TargetType) {
        print(request)
    }
}
