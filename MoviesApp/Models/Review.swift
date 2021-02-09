//
//  Review.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation

struct ReviewRespose: Codable {
    let results: [Review]
}

struct Review: Codable, Identifiable {
    let id: String?
    let author: String?
    let content: String?
}

extension Review {
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content
    }
}
