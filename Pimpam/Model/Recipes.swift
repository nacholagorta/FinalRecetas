//
//  Recipes.swift
//  Pimpam
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import Foundation
class Recipes {
    var recipeTitle: String!
    var recipeDifficulty: String!
    var recipeImg: String!
    var recipeIngredients:String!
    
    init(recipeTitle: String, recipeDifficulty: String, recipeImg: String,recipeIngredients: String) {
        self.recipeTitle = recipeTitle
        self.recipeDifficulty = recipeDifficulty
        self.recipeImg = recipeImg
        self.recipeIngredients = recipeIngredients
    }
}
