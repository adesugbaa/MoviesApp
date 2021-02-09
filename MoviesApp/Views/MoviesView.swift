//
//  MoviesView.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import SwiftUI

struct MoviesView: View {
    @State private var searchTerm = ""
    @State private var selectionIndex = 0
    @State private var selectedMovie: Movie?
    @State private var showMovie = false
    @State private var tabs = ["Now Playing", "Upcoming", "Trending"]
    
    @ObservedObject var movieManager = MovieDownloadManager()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .orange
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        movieManager.getNowPlaying()
    }
    
    var movies: [Movie] {
        movieManager.movies.filter {
            searchTerm.isEmpty ?
                true :
                $0.title.lowercased().localizedStandardContains(searchTerm.lowercased())
            
        }
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(tabs[selectionIndex])
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
                    .padding(.top)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.medium)
                    
                    TextField("Search...", text: $searchTerm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding()
            
            VStack {
                Picker("", selection: $selectionIndex) {
                    ForEach(0..<tabs.count) { index in
                        Text(tabs[index])
                            .font(.title)
                            .bold()
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: selectionIndex) { _ in
                    if selectionIndex == 0 {
                        movieManager.getNowPlaying()
                    } else if selectionIndex == 1 {
                        movieManager.getUpcoming()
                    } else if selectionIndex == 2 {
                        movieManager.getPopular()
                    }
                }
            }
            .padding()
            
            List {
                ForEach(movies) { movie in
                    Button(action: {
                        print(selectedMovie)
                        self.selectedMovie = movie
                    }) {
                        Text(movie.titleWithLanguage)
                    }
                }
            }
            
            Spacer()
            //.navigate(using: $selectedMovie, destination: showMovie)
            
//            NavigationLink(
//                destination: Text("Hello"),
//                isActive: $showMovie
//            ) {
//                EmptyView()
//
//            }
//            .onAppear {
//                movieManager.getNowPlaying()
//            }
        }
//        .background(
//            NavigationLink(
//                destination: Text("Hello"),
//                isActive: $showMovie
//            ) {
//                EmptyView()
//
//            }
//        )
        .navigate(using: $selectedMovie, destination: showMovie)
    }
    
    @ViewBuilder
    private func showMovie(_ movie: Movie) -> DiscoverView {
        DiscoverView()
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
