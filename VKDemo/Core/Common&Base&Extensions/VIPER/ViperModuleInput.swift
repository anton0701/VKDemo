//
//  ViperModuleInput.swift
//  Vanilla
//
//  Created by Anton Krylov on 11/05/2017.
//  Copyright © 2017 BrightBox. All rights reserved.
//

import Foundation

public protocol ViperModuleInputProtocol: class {
    var output: ViperModuleOutputProtocol! { get set }
}
