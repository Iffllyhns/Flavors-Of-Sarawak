//
//  FavoritesManager.swift
//  Flavors Of Sarawak
//
//  Created by Iffllyhns Azharri on 08/12/2023.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favoriteRecipes: [Recipe] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    init() {
        loadFavorites()
    }
    
    // MARK: - Favorite Operations
    
    func add(recipe: Recipe) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if !self.favoriteRecipes.contains(where: { $0.id == recipe.id }) {
                self.favoriteRecipes.append(recipe)
            }
        }
    }
    
    func remove(recipe: Recipe) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let index = self.favoriteRecipes.firstIndex(where: { $0.id == recipe.id }) {
                self.favoriteRecipes.remove(at: index)
            }
        }
    }
    
    func isFavorite(recipe: Recipe) -> Bool {
        return favoriteRecipes.contains(where: { $0.id == recipe.id })
    }
    
    // MARK: - Persistence
    
    private let favoritesKey = "favoriteRecipes"
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favoriteRecipes) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([Recipe].self, from: data) {
            favoriteRecipes = decoded
        }
    }
}

