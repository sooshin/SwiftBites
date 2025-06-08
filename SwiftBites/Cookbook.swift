//
//  Cookbook.swift
//  SwiftBites
//
//  Created by Shin on 6/4/25.
//

import Foundation
import SwiftData

@Model
final class Category: Identifiable, Hashable {
    var id: UUID
    @Attribute(.unique) var name: String
    @Relationship
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), name: String = "", recipes: [Recipe] = []) {
        self.id = id
        self.name = name
        self.recipes  = recipes
    }
}

@Model
final class Ingredient: Identifiable, Hashable {
    var id: UUID
    @Attribute(.unique) var name: String
    
    init(id: UUID = UUID(), name: String = "") {
        self.id = id
        self.name = name
    }
}

@Model
final class RecipeIngredient: Identifiable, Hashable {
    var id: UUID
    var ingredient: Ingredient
    var quantity: String
    
    init(id: UUID = UUID(), ingredient: Ingredient = Ingredient(), quantity: String = "") {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }
}

@Model
final class Recipe: Identifiable, Hashable {
    var id: UUID
    @Attribute(.unique) var name: String
    var summary: String
    @Relationship(deleteRule: .nullify, inverse: \Category.recipes)
    var category: Category?
    var serving: Int
    var time: Int
    @Relationship(deleteRule: .cascade)
    var ingredients: [RecipeIngredient]
    var instructions: String
    var imageData: Data?
    
    init(
      id: UUID = UUID(),
      name: String = "",
      summary: String = "",
      category: Category? = nil,
      serving: Int = 1,
      time: Int = 5,
      ingredients: [RecipeIngredient] = [],
      instructions: String = "",
      imageData: Data? = nil
    ) {
      self.id = id
      self.name = name
      self.summary = summary
      self.category = category
      self.serving = serving
      self.time = time
      self.ingredients = ingredients
      self.instructions = instructions
      self.imageData = imageData
    }
}
