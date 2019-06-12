//
//  FeedTarget.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum FeedTarget {
    case getFeed
}

extension FeedTarget: TargetType {
    
    private var sessionManager: IUserSessionManager {
        return  DI.container.core.sessionManager
    }
    
    var baseURL: URL {
        return URL(string: "https://api.vk.com/method/")!
    }
    
    var path: String {
        switch self {
        case .getFeed:
            return "newsfeed.get"
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
        case .getFeed:
            return .requestParameters(parameters: ["v": 5.95, "access_token": sessionManager.getAccessToken() ?? ""], encoding: URLEncoding.queryString)
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

extension FeedTarget: VKAccessTokenAuthorizable {
    var authorizationType: VKAuthorizationType {
        return .oauth
    }
}
