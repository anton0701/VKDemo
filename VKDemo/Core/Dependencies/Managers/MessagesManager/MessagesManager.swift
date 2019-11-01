//
//  MessagesManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 01.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya

class MessagesManager {
    private let messagesProvider: MoyaProvider<MessagesTarget>
    private let messagesParser: IFeedParser
    
    init(messagesProvider: MoyaProvider<MessagesTarget>,
               messagesParser: IFeedParser) {
        self.messagesProvider = messagesProvider
        self.messagesParser = messagesParser
    }
}

extension MessagesManager: IMessagesManager {
    func getConversations(success: @escaping ([FeedItem]) -> Void,
                          failure: @escaping FailureClosure) {
        
        _ = messagesProvider.request(.getConversations, success: { (conversationsResponse: ConversationsResponse) in
            print("HOORAY!!!!!!! CONVERSATIONS ARE OK")
        }, failure: { error in
            print("OMG! SO BAD! CONVERSATIONS FAILED !! ERROR:")
            print(error)
        })
    }
}
