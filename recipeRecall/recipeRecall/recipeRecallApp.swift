//
//  recipeRecallApp.swift
//  recipeRecall
//
//  Created by Haley Bear on 7/18/24.
//

import SwiftUI

// Using the educational key
let apiKey = 1


//func fetchDessertsFromAPI() async -> [Meal] {
//    let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert?api_key=\(apiKey)")!
//    let (data, _) = try await URLSession.shared.data(from: url)
//    let decoded = try JSONDecoder().decode(MealResponse.self: from:data)
//}
//
//struct MealResponse: Decodable {
//    let results: [Meal]
//}
//struct Meal: Decodable {
//    let strMeal: String
//    let strMealThumb: String
//    let idMeal: Int
//}

@main
struct recipeRecallApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
