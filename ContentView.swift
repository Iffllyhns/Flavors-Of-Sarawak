//
//  ContentView.swift
//  Flavors Sarawak
//
//  Created by Iffllyhns Azharri on 05/12/2023.
//

import SwiftUI
import RealityKit

import SwiftUI
import RealityKit

struct ContentView: View {
    var body: some View {
       TabBar()
           .environmentObject(FavoritesManager()) // Attach the FavoritesManager to the view hierarchy
    }
}
