//
//  HighlightsModelView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 02/02/23.
//

import Foundation
extension HighlightsPage{
    @MainActor
    class HighlightModelView: ObservableObject{
        @Published var products: [Product] = []

        init(){
            
        }
        
        func getAllFood() throws -> [FoodEntity]{
            let foodArray:[FoodEntity] = try CoreDataManager.shared.fetch(entityName: "FoodEntity")
            return foodArray
        }
        
        
        func refetchData() throws{
            products = try getProducts()
        }
        
        func getProducts() throws -> [Product]{
            var productArray:[Product] = []
            let foodArray = try getAllFood()
            for food in foodArray{
                productArray.append(Product(food: food))
            }
            return productArray
        }
    }
}
