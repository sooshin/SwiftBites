//
//  CookbookContainer.swift
//  SwiftBites
//
//  Created by Shin on 6/4/25.
//

import Foundation
import SwiftData
import SwiftUI

class CookbookContainer {
    @MainActor
    static func create() -> ModelContainer {
        let schema = Schema([Category.self, Ingredient.self, RecipeIngredient.self, Recipe.self])
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: schema, configurations: configuration)
        
        return container
    }
}
