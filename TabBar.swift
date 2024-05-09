//
//  TabBar.swift
//  Flavors Sarawak
//
//  Created by Iffllyhns Azharri on 05/12/2023.
//

import SwiftUI
import AVFoundation

struct TabBar: View {
    @StateObject var favoritesManager = FavoritesManager() // Instantiate the FavoritesManager
    @State var audioPlayer: AVAudioPlayer?

    init() {
        setupAudioPlayer()
        setupAudioSession()
    }

    private mutating func setupAudioPlayer() {
        if let path = Bundle.main.path(forResource: "Sarawak", ofType: "mp3") {
            do {
                let player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                self._audioPlayer = State(initialValue: player)  // Use the underlying _property to set State value from init
            } catch {
                print("Error initializing the audio player.")
            }
        }
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }

            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .environmentObject(favoritesManager) // Supply the FavoritesManager to the TabView and its children
        .onAppear {
            audioPlayer?.play()
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
