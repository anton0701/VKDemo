//
//  MoyaProvider+Mapping.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public typealias FailureClosure = (RequestError) -> Void

extension MoyaProvider {
    open func request<T: Codable>(_ target: Target,
                                  callbackQueue: DispatchQueue? = .none,
                                  progress: ProgressBlock? = .none,
                                  success: @escaping (T) -> Void,
                                  failure: @escaping FailureClosure) -> Cancellable {
        
        return request(target, callbackQueue: callbackQueue, progress: progress) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    _ = try moyaResponse.filterSuccessfulStatusCodes()
                }
                catch _ {
                    // Неправильный статус код
                    failure(.error(code: HTTPStatusCode(rawValue: moyaResponse.statusCode) ?? .badRequest))
                }
                
                let jsonDecoder = JSONDecoder()
                do {
                    let mappedData = try jsonDecoder.decode(MappedResponse<T>.self, from: moyaResponse.data)
                    // Все прошло хорошо, размапилось и не было VkError
                    success(mappedData.response)
                } catch let error1 {
                    do {
                        let errorMappedData = try jsonDecoder.decode(ErrorDto.self, from: moyaResponse.data)
                        // Пришел VkError
                        failure(.vkError(error: errorMappedData.error))
                        return
                    } catch {
                        // Ошибка маппинга
                        guard let decodingError = error1 as? DecodingError else {
                            failure(.mappingError)
                            return
                        }
                        
                        switch decodingError {
                        case .typeMismatch(let type, let context):
                            print(type)
                            print(context)
                            break
                        case .dataCorrupted(let context):
                            print("dataCorrupted")
                            break
                        case .keyNotFound(let codingKey, let context):
                            let a = context.codingPath
                            let b = context.debugDescription
                            let c = context.underlyingError
                            let d = codingKey
                            print("keyNotFound")
                            break
                        case .valueNotFound(let type, let context):
                            print("valueNotFound")
                            break
                        }
                        failure(.mappingError)
                    }
                }
            case .failure(_):
                // Сюда не должен попадать
                fatalError("FATAL ERROR!!!")
            }
        }
    }
}

// Не используется
extension MoyaProvider {
    // TODO: удалить или привести к нормальному виду!
    // Идея: нам может понадобиться response object
    open func request1<T: Codable>(_ target: Target,
                                   callbackQueue: DispatchQueue? = .none,
                                   progress: ProgressBlock? = .none,
                                   success: @escaping (RequestResponse<T>) -> Void,
                                   failure: @escaping FailureClosure) -> Cancellable {
        
        return request(target, callbackQueue: callbackQueue, progress: progress) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let decoder = JSONDecoder()
                    let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                    let json = try filteredResponse.mapJSON() // type Any
                    let mappedData = try decoder.decode(T.self, from: filteredResponse.data)
                    print("JSON: \(json)")
                    print("Mapped data: \(mappedData)")
                    // Do something with your json.
                }
                catch let error {
                    // Here we get either statusCode error or jsonMapping error.
                    // TODO: handle the error == best. comment. ever.
                    print(error)
                }
            case .failure(let error):
                print("case .failure(error):")
                print(error)
            }
        }
    }
}

// TODO:
//extension Bool {
//    override public init(from decoder: Decoder) throws {
//        do {
//            let container = try decoder.singleValueContainer()
//            self = try container.decode(Bool.self)
//        } catch {
//            assertionFailure("ERROR: \(error)")
//            // TODO: automatically send a report about a corrupted data
//            self = false
//        }
//    }
//}

extension Bool {
    init(_ int: Int) {
        self = (int == 1)
    }
}
