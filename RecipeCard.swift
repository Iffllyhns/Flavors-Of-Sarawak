//
//  RecipeCard.swift
//  Flavors Of Sarawak
//
//  Created by Iffllyhns Azharri on 05/12/2023.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(spacing: 0) {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 217, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            VStack(alignment: .center, spacing: -5) {
                Text(recipe.name)
                    .font(.headline) // or use .title or .largeTitle for larger sizes
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }

            .padding(12)
            .background(Color(UIColor.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding(10)
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        //Group {
            RecipeCard(recipe: Recipe.all[0])
               // .previewLayout(.sizeThatFits)
               // .environment(\.colorScheme, .light)
            
            //RecipeCard(recipe: Recipe.all[0])
                //.previewLayout(.sizeThatFits)
                //.environment(\.colorScheme, .dark)
        //}
    }
}
