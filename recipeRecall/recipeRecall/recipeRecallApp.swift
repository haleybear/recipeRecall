//
//  recipeRecallApp.swift
//  recipeRecall
//
//  Created by Haley Bear on 7/18/24.
//

import SwiftUI

// Using the educational key
let apiKey = 1


enum MealError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

//Get the data for all desserts
struct MealResponse: Decodable {
    let meals: [Meal]
}

//Break the desserts down by meal?
struct Meal: Decodable, Identifiable {
    var id: String {idMeal}
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct RecipeResponse: Decodable {
    let meals: [Recipe]
}

struct Recipe: Decodable, Identifiable {
    var id: String {idMeal}
    let idMeal: String
    let title: String
    let thumbnail: String
    let recipeInstructions: String
    //To-Do - Ingredients and Measurements will need to either be pre-compiled and displayed or....something else
    var ingredient: String
    var measurement: String
}

// Fetch desserts

func fetchDesserts() async throws -> [Meal] {
    guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { throw MealError.invalidURL }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw MealError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(MealResponse.self, from: data).meals
    } catch {
        throw MealError.invalidData
    }
}

func fetchRecipeDetails( recipeID : Meal ) async throws -> [Recipe] {
    let recipeID = recipeID
    guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(recipeID)") else { throw MealError.invalidURL }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
        throw MealError.invalidResponse
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(RecipeResponse.self, from: data).meals
    } catch {
        throw MealError.invalidData
    }
}


// Sort function - in the api call return preview the desserts are already in alphabetical order. Is it preferable to trust that they will remain that way or to add extra functionality to check this and potentially resort them?

// build a test where the alphabet is Not correct and see that this sort is only called when necessary (have a sanity test for all calls, but only call sort when needed)


@main
struct recipeRecallApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
