//
//  View+Extension.swift
//  MoviesApp
//
//  Created by Ayorinde Adesugba on 2/9/21.
//

import SwiftUI

extension View {
    @ViewBuilder
    func navigate<Value, Destination: View>(
        using binding: Binding<Value?>,
        @ViewBuilder destination: (Value) -> Destination
    ) -> some View {
        background(NavigationLink(binding, destination: destination))
    }
}
