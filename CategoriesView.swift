//
//  CategoriesView.swift
//  Flavors Sarawak
//
//  Created by Iffllyhns Azharri on 05/12/2023.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: -40) {
                    ForEach(Category.allCases, id: \.self) { category in
                        NavigationLink(destination: CategorySection(category: category)) {
                            CategorySection(category: category)
                        }
                        .buttonStyle(PlainButtonStyle()) // Add button style
                    }
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("My Categories")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Flavors Of Sarawak").font(.headline)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CategorySection: View {
    var category: Category

    var body: some View {
        VStack(alignment: .leading, spacing: -15) {
            Text(category.rawValue)
                .font(.title)
                .bold()
                .padding(.leading, 20)
                .padding(.top, 10)
                .foregroundColor(.blue) // Set the text color to blue

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(Recipe.all.filter { $0.category == category.rawValue }) { recipe in
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeCard(recipe: recipe)
                               // .shadow(nil) // Remove shadow
                        }
                        .buttonStyle(PlainButtonStyle()) // Remove button styling
                    }
                }
                .padding()
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .padding(.bottom, 10)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
