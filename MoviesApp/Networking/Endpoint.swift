//
//  EndPoint.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation

let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjMyOTJiZTVkMDNmNzJhY2EwOGEyM2Y2MTkyYjAyMiIsInN1YiI6IjU1MDE5MjZjOTI1MTQxM2RhMTAwMjk1NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.f5v_Ffo2koC7ViTo9RuOaSnPjNJAQ6QzOT3_eiQ61yA"

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json;charset=utf-8"
        ]
    }
}

extension Endpoint {
    static func nowPlaying(page: Int) -> Self {
        Endpoint(
            path: "movie/now_playing",
            queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        )
    }
    
    static func upcoming(page: Int) -> Self {
        Endpoint(
            path: "movie/upcoming",
            queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        )
    }
    
    static func popular(page: Int) -> Self {
        Endpoint(
            path: "movie/popular",
            queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
                URLQueryItem(name: "page", value: "\(page)"),
            ]
        )
    }
    
    static func cast(movieId: Int) -> Self {
        Endpoint(
            path: "movie/\(movieId)",
            queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
            ]
        )
    }
    
    static func reviews(movieId: Int) -> Self {
        Endpoint(
            path: "movie/\(movieId)/reviews",
            queryItems: [
                URLQueryItem(name: "language", value: "en-US"),
            ]
        )
    }
}
