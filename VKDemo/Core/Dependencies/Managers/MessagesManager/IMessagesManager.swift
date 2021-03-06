//
//  IMessagesManager.swift
//  VKDemo
//
//  Created by Anton Krylov on 01.11.2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol IMessagesManager {
    func getConversations(success: @escaping ([FeedItem]) -> Void,
                          failure: @escaping FailureClosure)
}
