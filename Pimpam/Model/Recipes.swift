//
//  Recipes.swift
//  Pimpam
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import Foundation
class Recipes {
    var name: String!
    var difficult: String!
    var foodrecipesimg: String!
    
    init(name: String, difficult: String, foodrecipesimg: String) {
        self.name = name
        self.difficult = difficult
        self.foodrecipesimg = foodrecipesimg
    }
}
