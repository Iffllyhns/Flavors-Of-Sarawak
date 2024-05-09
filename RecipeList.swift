//
//  RecipeList.swift
//  Flavors Of Sarawak
//
//  Created by Iffllyhns Azharri on 06/12/2023.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]

    @State private var searchText = ""

    var filteredRecipes: [Recipe] {
        recipes.filter { recipe in
            searchText.isEmpty ||
                recipe.name.localizedCaseInsensitiveContains(searchText) ||
                recipe.ingredients.contains { ingredient in
                    ingredient.localizedCaseInsensitiveContains(searchText)
                }
        }
    }

    var discoverRecipes: [Recipe] {
        return Array(recipes.prefix(9))
    }

    var body: some View {
        VStack {
            // Search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search for Recipes or Ingredients", text: $searchText)
                    .padding(.leading, 10)
                    .foregroundColor(.primary)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemGray6)))
            .padding(.horizontal, 2)
            .padding(.bottom, 5)

            // Discover section
            if !discoverRecipes.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(discoverRecipes) { recipe in
                            NavigationLink(destination: RecipeView(recipe: recipe)) {
                                DiscoverCard(recipe: recipe)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
            }

            HStack {
                Text("\(filteredRecipes.count) \(filteredRecipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .fontWeight(.medium)
                    .opacity(0.7)
            }
            .padding(.horizontal)

            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: -5)], spacing: -70) {
                ForEach(filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                           // .shadow(nil) // Set shadow to nil
                    }
                    .fontWeight(.bold)
                    .buttonStyle(PlainButtonStyle()) // Remove the button styling
                }
            }

           //.padding(.top)
        }
        .padding(.horizontal)
        .shadow(color: Color.clear, radius: 0, x: 0, y: 0) // Remove the shadow effect
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}

struct DiscoverCard: View {
    var recipe: Recipe

    var body: some View {
        VStack {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 100)
                .cornerRadius(10)
                .overlay(
                    Text("Discover")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color.blue)
                        .cornerRadius(5),
                    alignment: .topTrailing
                )

            Text(recipe.name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(2)
                .padding(.top, 5)
        }
        .frame(width: 150)
    }
}
