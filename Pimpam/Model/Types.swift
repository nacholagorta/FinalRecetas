//
//  Types.swift
//  
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//

import Foundation
class Types {
    var name: String!
    var description: String!
    var numplats: Int!
    var foodimg: String!
    var arrRecipes : [Recipes]!
    
    
    init(name: String, description: String, numplats: Int, foodimg: String, arrRecipes: [Recipes]) {
        self.name = name
        self.description = description
        self.numplats = numplats
        self.foodimg = foodimg
        self.arrRecipes = arrRecipes
    }
}
