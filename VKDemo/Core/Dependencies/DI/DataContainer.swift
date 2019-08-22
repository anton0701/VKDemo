//
//  DataContainer.swift
//  VKDemo
//
//  Created by Anton Krylov on 15/05/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya

protocol DataContainerProtocol {
    var feedManager: IFeedManager { get }
}

class DataContainer {
    private let serviceContainer = ServiceContainer()
    private let core: CoreContainerProtocol
    private let parser: ParserContainerProtocol
    
    init(core: CoreContainerProtocol,
         parser: ParserContainerProtocol) {
        
        self.core = core
        self.parser = parser
        
        let authPlugin = VKAccessTokenPlugin(userSessionManager: core.sessionManager)
        let loggerPlugin = NetworkLoggerPlugin(verbose: true)
        let feedProvider = MoyaProvider<FeedTarget>(plugins: [authPlugin, loggerPlugin])
        serviceContainer.add(services: feedProvider)
        
        let feedManager = FeedManager(feedProvider: feedProvider,
                                      feedParser: parser.feedParser)
        serviceContainer.add(services: feedManager)
    }
}

extension DataContainer: DataContainerProtocol {
    var feedManager: IFeedManager {
        return serviceContainer.get(service: FeedManager.self)!
    }
}
