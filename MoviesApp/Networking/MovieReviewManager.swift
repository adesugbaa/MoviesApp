//
//  MovieReviewManager.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import Foundation
import Combine

final class MovieReviewManager: ObservableObject {
    @Published var reviews: [Review] = []
    
    private let networkController: NetworkControllerProtocol
    private let networkManager: NetworkManagerProtocol
    private let movie: Movie
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(movie: Movie, networkController: NetworkControllerProtocol = NetworkController()) {
        self.networkController = networkController
        self.networkManager = NetworkManager(networkController: networkController)
        
        self.movie = movie
    }
    
    func getReviews() {
        
    }
}
