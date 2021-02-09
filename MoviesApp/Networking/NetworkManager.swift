//
//  NetworkManager.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation
import Combine

protocol NetworkManagerProtocol: AnyObject {
    var networkController: NetworkControllerProtocol { get }

    func getNowPlaying(page: Int) -> AnyPublisher<MovieRespose, Error>
    func getUpcoming(page: Int) -> AnyPublisher<MovieRespose, Error>
    func getPopular(page: Int) -> AnyPublisher<MovieRespose, Error>
    func getCast(movie: Movie) -> AnyPublisher<CastRespose, Error>
}

final class NetworkManager: NetworkManagerProtocol {
    let networkController: NetworkControllerProtocol
        
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getNowPlaying(page: Int) -> AnyPublisher<MovieRespose, Error> {
        let endpoint = Endpoint.nowPlaying(page: page)
        
        return networkController.get(type: MovieRespose.self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
    
    func getUpcoming(page: Int) -> AnyPublisher<MovieRespose, Error> {
        let endpoint = Endpoint.upcoming(page: page)
        
        return networkController.get(type: MovieRespose.self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
    
    func getPopular(page: Int) -> AnyPublisher<MovieRespose, Error> {
        let endpoint = Endpoint.popular(page: page)
        
        return networkController.get(type: MovieRespose.self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
    
    func getCast(movie: Movie) -> AnyPublisher<CastRespose, Error> {
        let endpoint = Endpoint.cast(movieId: movie.id ?? 0)
        
        return networkController.get(type: CastRespose.self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
}
