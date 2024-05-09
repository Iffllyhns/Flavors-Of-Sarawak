//
//  FavoritesView.swift
//  Flavors Of Sarawak
//
//  Created by Iffllyhns Azharri on 05/12/2023.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(favoritesManager.favoriteRecipes, id: \.id) { favoriteRecipe in
                        NavigationLink(destination: RecipeView(recipe: favoriteRecipe)) {
                            VStack {
                                Image(favoriteRecipe.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150)
                                    .cornerRadius(10)
                                    .clipped()
                                Text(favoriteRecipe.name)
                                    .font(.headline)
                                    .padding(.top, 5)
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Favorites")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Flavors Of Sarawak").font(.headline)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesManager())  // Providing the FavoritesManager for the preview
    }
}
