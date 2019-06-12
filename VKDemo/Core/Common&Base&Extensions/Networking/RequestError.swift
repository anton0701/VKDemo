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
    case mappingError
    case badResponse
    case unauthorized
    case noInternetConnection
    case other(error: CustomRequestError)
    
    case vkError(error: VkError)
}

public struct ErrorDto: Codable {
    let error: VkError
}

public struct VkError: Codable {
    let errorCode: Int
    let errorMsg: String
    
    private enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case errorMsg = "error_msg"
    }
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
