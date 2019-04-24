//
//  BaseCoordinator.swift
//  VKDemo
//
//  Created by Anton Krylov on 24/04/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

public enum RequestError: Error {
    case error(code: HTTPStatusCode)
    case badResponse
    case unauthorized
    case noInternetConnection
    case other(error: CustomRequestError)
}

public protocol CustomRequestError {
    var title: String { get }
    var description: String? { get }
}

public struct TextRequestError: CustomRequestError {
    public let title: String
    public let description: String?

    public init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
    }
}
