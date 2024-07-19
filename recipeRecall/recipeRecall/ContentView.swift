//
//  ContentView.swift
//  recipeRecall
//
//  Created by Haley Bear on 7/18/24.
//

// for the sake of timing - lock the view unless you get everything else done first

import SwiftUI

var recipeTitle = "Yummy Dessert Name"

struct ContentView: View {
    @State private var meals = [Meal]()
    @State private var recipes = [Recipe]()
    //let recipe: Recipe
    // #DETAILSELECTION @State var selection = ClickableRecipeCard*
    // *whether the card is expandable or transitions to new screen
    var body: some View {
        //main menu list view item
        
        NavigationStack{
            List(meals) { meal in
                HStack {
                    AsyncImage(url: URL(string: meal.strMealThumb + "/preview")){ phase in switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100, maxHeight: 100)
                                .cornerRadius(25.0)
                                .accessibilityLabel("Image preview of \(meal.strMeal)")
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                            }
                    }
                    Spacer().frame(width: 4)
                    NavigationLink(meal.strMeal){
                        VStack(alignment: .leading){
                            Text(meal.strMeal)
                                .font(.headline)
                            }
                        }
                    }
                }
        }
        .task{
            do{
                meals = try await fetchDesserts()
//                List(meals){ recipe in
//                   recipe = try await fetchDesserts( recipe.idMeal )
//                }
                print("MealResponse")
            } catch MealError.invalidURL{
                print("Invalid Url")
            } catch MealError.invalidData{
                print("Invalid Data")
            } catch MealError.invalidResponse{
                print("Invalid Response")
            } catch {
                print("Unknown Error - our apologies")
            }
        }
        
        // detail view to be moved to separate screen/ or expand and contract
        // Picker("Select Recipe", selection: $selection){
        //    ForEach(recipe.allCases, id:\.self)
        //}
        // .pickerStyle(.segmented)
        // async api call here
        // Recipe?.ingredient ?? "Placeholder Ingredient
        
        //On selection action .task{fetchRecipeDetails( recipeID )}
    }
}


#Preview {
  ContentView()
}
