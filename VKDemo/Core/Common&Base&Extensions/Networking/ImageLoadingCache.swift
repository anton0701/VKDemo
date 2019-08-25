//
//  ImageLoadingCache.swift
//  Vanilla
//
//  Created by Anton Krylov on 15.03.18.
//  Copyright © 2018 BrightBox. All rights reserved.
//

import Foundation

class ImageLoadingCache {
    static let sharedCache: NSCache = { () -> NSCache<AnyObject, AnyObject> in
        let cache = NSCache<AnyObject, AnyObject>()
        cache.name = "ImageLoadingCache"
        cache.countLimit = 200
        cache.totalCostLimit = 10*1024*1024

        return cache
    }()
}
