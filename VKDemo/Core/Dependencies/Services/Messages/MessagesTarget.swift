//
//  MessagesTarget.swift
//  VKDemo
//
//  Created by Anton Krylov on 01.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum MessagesTarget {
    case getConversations
}

extension MessagesTarget: TargetType {
    
    private var sessionManager: IUserSessionManager {
        return  DI.container.core.sessionManager
    }
    
    var baseURL: URL {
        return URL(string: "https://api.vk.com/method/")!
    }
    
    var path: String {
        switch self {
        case .getConversations:
            return "messages.getConversations"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getConversations:
            return .requestParameters(parameters: ["v": 5.108, "access_token": sessionManager.getAccessToken() ?? "", "count" : "200"], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
}

extension MessagesTarget: VKAccessTokenAuthorizable {
    var authorizationType: VKAuthorizationType {
        return .oauth
    }
}
