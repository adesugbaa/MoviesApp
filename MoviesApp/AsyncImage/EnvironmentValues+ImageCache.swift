//
//  EnvironmentValues+ImageCache.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TempImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
