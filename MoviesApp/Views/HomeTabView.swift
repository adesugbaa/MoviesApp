//
//  HomeTabView.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import SwiftUI

struct HomeTabView: View {
    enum Tab: Int {
        case movies
        case discover
    }
    
    @State private var selectedTab: Tab = .movies
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView().tabItem {
                tabBarItem(text: "Movies", image: "film")
            }.tag(Tab.movies)
                
            
            DiscoverView().tabItem {
                tabBarItem(text: "Discover", image: "square.stack")
            }.tag(Tab.discover)
        }
    }
    
    private func tabBarItem(text: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .imageScale(.large)
            
            Text(text)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
