//
//  MappedResponse.swift
//  VKDemo
//
//  Created by Anton Krylov on 10/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

struct MappedResponse<T: Codable>: Codable {
    let response: T
}
