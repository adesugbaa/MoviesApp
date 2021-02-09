//
//  ContentView.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettings = false
    
    var body: some View {
        NavigationView {
            Group {
                HomeTabView()
            }
            .navigationBarTitle("Movies", displayMode: .automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    settingsButton
                }
            }
            .sheet(isPresented: $showSettings, content: {
                SettingsView(isPresented: $showSettings)
            })
        }
    }
    
    private var settingsButton: some View {
        Button(action: {
            showSettings.toggle()
        }) {
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }
            .frame(width: 30, height: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 8f3292be5d03f72aca08a23f6192b022
