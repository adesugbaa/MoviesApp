//
//  ImageCache.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import UIKit

protocol ImageCache {
    subscript(_ url: URL) -> UIImage? { get set }
}

struct TempImageCache: ImageCache {
    subscript(_ url: URL) -> UIImage? {
        get {
            cache.object(forKey: url as NSURL)
        }
        set {
            newValue == nil ? cache.removeObject(forKey: url as NSURL) : cache.setObject(newValue!, forKey: url as NSURL)
        }
    }
    
    private let cache: NSCache<NSURL, UIImage> = {
        let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 500
        cache.totalCostLimit = 1024 * 1024 * 500
        
        return cache
    }()
}
