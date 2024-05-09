//
//  RecipeView.swift
//  Flavors Of Sarawak
//
//  Created by Iffllyhns Azharri on 06/12/2023.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe

    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var isFavorite: Bool = false
    @State private var showARView = false

    @State private var rotation = Angle(degrees: 0)
    @State private var scale: CGFloat = 1.0

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Recipe Name
                    GeometryReader { geometry in
                        VStack {
                            Text(recipe.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .frame(width: geometry.size.width, alignment: .center)
                            Spacer()
                        }
                    }

                    // Recipe Image and AR Button
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 200)
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .rotation3DEffect(rotation, axis: (x: 0, y: 1, z: 0))
                            .scaleEffect(scale)
                            .gesture(
                                SimultaneousGesture(
                                    RotationGesture()
                                        .onChanged { value in
                                            self.rotation = value
                                        },
                                    MagnificationGesture()
                                        .onChanged { value in
                                            self.scale = value.magnitude
                                        }
                                )
                            )
                        Button(action: {
                            self.showARView.toggle()
                        }) {
                            HStack {
                                Image(systemName: "arkit")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.white)
                                Text("View in AR")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .cornerRadius(8)
                        }
                        .padding(8)
                    }
                    .padding(.horizontal)

                    // Recipe Description
                    Text(recipe.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Ingredients
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Ingredients:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 15) {
                                ForEach(recipe.ingredients, id: \.self) { ingredient in
                                    Text(ingredient)
                                        .foregroundColor(Color.primary)
                                        .font(.headline)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 8)
                                        .background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color.blue.opacity(0.15))
                                        )
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)

                    // Directions
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Instructions:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 15) {
                            ForEach(recipe.directions.split(separator: "\n"), id: \.self) { direction in
                                Text(" \(String(direction))")
                                    .font(.body)
                                    .foregroundColor(Color(.secondaryLabel))
                                    .padding(.horizontal)
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)

                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Flavors Of Sarawak")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationBarItems(
                trailing:
                    Button(action: {
                        if self.favoritesManager.isFavorite(recipe: recipe) {
                            self.favoritesManager.remove(recipe: recipe)
                            self.isFavorite = false
                        } else {
                            self.favoritesManager.add(recipe: recipe)
                            self.isFavorite = true
                        }
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(isFavorite ? .red : .gray)
                            .padding(8)
                    }
            )
            .sheet(isPresented: $showARView) {
                NavigationView {
                    ARContainerView(arAssetName: recipe.arAssetName, recipeName: recipe.name)
                        .navigationBarTitle("", displayMode: .inline)
                        .navigationBarItems(leading:
                            Button(action: {
                                self.showARView = false
                            }) {
                                Image(systemName: "arrow.backward.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        )
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.all[0])
            .environmentObject(FavoritesManager())
    }
}
