//
//  ParseContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

protocol ParserContainerProtocol {
    var feedParser: IFeedParser { get }
    var messagesParser: IMessagesParser { get }
}

class ParserContainer: ParserContainerProtocol {
    var feedParser: IFeedParser {
        return FeedParser()
    }
    
    var messagesParser: IMessagesParser {
        return MessagesParser()
    }
}
