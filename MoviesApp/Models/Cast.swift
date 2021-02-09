//
//  Cast.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation

struct CastRespose: Codable {
    let cast: [Cast]
}

struct Cast: Codable, Identifiable {
    let id: Int?
    let name: String?
    let character: String?
    let profilePath: String?
    
    var fullProfilePath: String {
        if let path = profilePath {
            return "https://image.tmdb.org/t/p/original/\(path)"
        }
        
        return "https://picsum.photos/200/300"
    }
}

extension Cast {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case character
        case profilePath = "profile_path"
    }
}
