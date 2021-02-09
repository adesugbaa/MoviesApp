//
//  Movie.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation

struct MovieRespose: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let originalLanguage: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let popularity: Double
    let voteAverage: Double
    let voteCount: Int
    let video: Bool
    let adult: Bool
    let releaseDate: String
    
    var fullPosterPath: String {
        //if let path = posterPath {
            return "https://image.tmdb.org/t/p/original/\(posterPath)"
        //}
        
        //return ""
    }
    
    var voteAverageCalc: Double {
        //if let vote = voteAverage {
            return voteAverage / 10.0
        //}
        
        //return 0.0
    }
    
    var titleWithLanguage: String {
        //guard let title = title,
        //      let lang = originalLanguage else { return "" }
        
        return "\(title)(\(originalLanguage))"
    }
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalLanguage = "original_language"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case video
        case adult
        case releaseDate = "release_date"
    }
}
