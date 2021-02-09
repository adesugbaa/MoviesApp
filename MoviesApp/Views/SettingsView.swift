//
//  SettingsView.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/8/21.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    
    @State private var selection = 1
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $selection, label: Text("Favorite Genre")) {
                    Text("Action").tag(1)
                    Text("Comedy").tag(2)
                    Text("Horror").tag(3)
                    Text("SciFi").tag(4)
                }
                
                Section(header: Text("Email")) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Save")
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    closeButton
                }
            }
        }
    }
    
    private var closeButton: some View {
        Button(action: {
            isPresented = false
        }) {
            HStack {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }
            .frame(width: 30, height: 30)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isPresented: .constant(true))
    }
}
