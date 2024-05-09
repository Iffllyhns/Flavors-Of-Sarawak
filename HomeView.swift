//
//  HomeView.swift
//  Flavors Sarawak
//
//  Created by Iffllyhns Azharri on 05/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: Recipe.all) //connect dengan RecipeList
            }
                    .navigationTitle("My Recipes")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Flavors Of Sarawak").font(.headline)
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
