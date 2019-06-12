//
//  BoolInt.swift
//  VKDemo
//
//  Created by Anton Krylov on 12/06/2019.
//  Copyright © 2019 Anton Krylov. All rights reserved.
//

import Foundation

enum BoolInt: Int, Codable {
    case `true` = 1
    case `false` = 0
}

extension BoolInt {
    func asBool() -> Bool {
        return self == .true
    }
}
