//
//  ContentView.swift
//  recipeRecall
//
//  Created by Haley Bear on 7/18/24.
//

import SwiftUI

var recipeTitle = "Yummy Dessert Name"

struct Recipe{
    let title: String
    let thumbnail: String
}

struct ContentView: View {
       
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.blue)
                .frame(width: 100, height:100)
                .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading){
                Text(recipeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
