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
    case getFeed(count: Int, startFrom: String?)
    case addLike(feedItem: FeedItem)
    case deleteLike(feedItem: FeedItem)
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
        case .addLike:
            return "likes.add"
        case .deleteLike:
            return "likes.delete"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getFeed:
            return .get
        case .addLike:
            return .post
        case .deleteLike:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getFeed(let count, let startFrom):
            let startFromString = startFrom ?? ""
            
            return .requestParameters(parameters: ["v": 5.95,
                                                   "access_token": sessionManager.getAccessToken() ?? "",
                                                   "filters" : "post,photo",
                                                   "count": count,
                                                   "start_from": startFromString],
                                      encoding: URLEncoding.queryString)
        case .addLike(let feedItem):
            let feedType = feedItem.item.type
            let ownerId = feedItem.item.sourceId
            let itemId = (feedItem.item.postId != nil) ? String(describing: feedItem.item.postId!) : ""
            let standardParams = ["v": 5.103,
                                  "access_token": sessionManager.getAccessToken() ?? "",
                                  "type": feedType,
                                  "owner_id": ownerId,
                                  "item_id": itemId] as [String: Any]
            
            return .requestParameters(parameters: standardParams,
                                      encoding: URLEncoding.httpBody)
        case .deleteLike(let feedItem):
            let feedType = feedItem.item.type
            let ownerId = feedItem.item.sourceId
            let itemId = (feedItem.item.postId != nil) ? String(describing: feedItem.item.postId!) : ""
            let standardParams = ["v": 5.103,
                                  "access_token": sessionManager.getAccessToken() ?? "",
                                  "type": feedType,
                                  "owner_id": ownerId,
                                  "item_id": itemId] as [String: Any]
            
            return .requestParameters(parameters: standardParams,
                                      encoding: URLEncoding.httpBody)
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
