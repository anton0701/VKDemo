//
//  RestServiceModel.swift
//  Vanilla
//
//  Created by Konstantin Ursul on 8/3/17.
//  Copyright © 2017 BrightBox. All rights reserved.
//

import Foundation
import Alamofire

public enum DateError: Error {
    case invalidDate
}

public enum Result<Value> {
    case success(Value)
    case failure(RequestError)

    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }

    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}

public struct NoData: Codable {}

public struct RequestResponse<T: Codable> {
    public private(set) var data: Data?
    public private(set) var mappedData: T!
    public private(set) var response: HTTPURLResponse?
    public var code: HTTPStatusCode {
        return response != nil ? HTTPStatusCode(HTTPResponse: response)! : .internalServerError
    }
    public private(set) var error: Error?
    public private(set) var result: Result<T>

    init(data: Data?, response: URLResponse?, error: Error?, successCodes: Range<Int>? = nil) {
        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
//            let container = try decoder.singleValueContainer()
//            let dateStr = try container.decode(String.self)
//
//            if let date = Date.create(from: dateStr, format: "yyyy-MM-dd") {
//                return date
//            }
//            if let date = Date.create(from: dateStr, format: "yyyy-MM-dd'T'HH:mm") {
//                return date
//            }
//            if let date = Date.create(from: dateStr, format: "yyyy-MM-dd'T'HH:mm:ss") {
//                return date
//            }
//            if let date = Date.create(from: dateStr, format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ") {
//                return date
//            }
//            if let date = Date.create(from: dateStr, format: "yyyy-MM-dd'T'HH:mm:ssZ") {
//                return date
//            }
//            throw DateError.invalidDate
//        })

        self.response = response as? HTTPURLResponse
        self.data = data
        self.error = error

        let httpCode = HTTPStatusCode(HTTPResponse: self.response) ?? .internalServerError

        guard httpCode != .unauthorized else {
            result = .failure(RequestError.unauthorized)
            return
        }

        guard (error as? URLError)?.code != .notConnectedToInternet else {
            result = .failure(RequestError.noInternetConnection)
            return
        }

        guard let code = self.response?.statusCode, 200...299 ~= code else {
            self.result = .failure(RequestError.error(code: httpCode))
            return
        }

        guard let data = data else {
            result = .failure(RequestError.error(code: httpCode))
            return
        }

        if let noData = NoData() as? T {
            self.result = .success(noData)
            return
        }

        do {
            self.mappedData = try decoder.decode(T.self, from: data)

            self.result = .success(mappedData)
        } catch let error {
            print(error.localizedDescription)

            self.error = error
            result = .failure(RequestError.error(code: httpCode))
        }
    }
}
