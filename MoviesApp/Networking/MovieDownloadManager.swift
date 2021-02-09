//
//  MovieDownloadManager.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation
import Combine

final class MovieDownloadManager: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var cast: [Cast] = []
    
    private let networkController: NetworkControllerProtocol
    private let networkManager: NetworkManagerProtocol
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(networkController: NetworkControllerProtocol = NetworkController()) {
        self.networkController = networkController
        self.networkManager = NetworkManager(networkController: networkController)
    }
    
    func getNowPlaying() {
        networkManager.getNowPlaying(page: 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get movies: \(error)")
                case .finished: break
                }
            }) { response in
                print(response.results)
                self.movies = response.results
            }
            .store(in: &subscriptions)
    }
    
    func getUpcoming() {
        networkManager.getUpcoming(page: 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get movies: \(error)")
                case .finished: break
                }
            }) { response in
                print(response.results)
                self.movies = response.results
            }
            .store(in: &subscriptions)
    }
    
    func getPopular() {
        networkManager.getPopular(page: 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get movies: \(error)")
                case .finished: break
                }
            }) { [weak self] response in
                guard let self = self else { return }
                
                print(response.results)
                self.movies = response.results
            }
            .store(in: &subscriptions)
    }
    
    func getCast(for movie: Movie) {
        networkManager.getCast(movie: movie)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get cast: \(error)")
                case .finished: break
                }
            }) { [weak self] response in
                guard let self = self else { return }
                
                print(response.cast)
                self.cast = response.cast
            }
            .store(in: &subscriptions)
    }
}
