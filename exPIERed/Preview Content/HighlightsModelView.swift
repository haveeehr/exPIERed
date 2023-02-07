//
//  HighlightsModelView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 02/02/23.
//

import Foundation
extension HighlightsPage {
    @MainActor
    class HighlightModelView: ObservableObject {
        // MARK: Lifecycle

        init() {}

        // MARK: Internal

        @Published var products: [Product] = []

        func getAllFood() throws -> [FoodEntity] {
            let foodArray: [FoodEntity] = try CoreDataManager.shared.fetch(entityName: "FoodEntity")
            return foodArray
        }

        func refetchData() throws {
            products = try getProducts()
        }

        func getProducts() throws -> [Product] {
            var productArray: [Product] = []
            let foodArray = try getAllFood()
            for food in foodArray {
                productArray.append(Product(food: food))
            }
            return productArray
        }

        func deleteFood(product: Product) throws {
            let foodArray = try getAllFood()
            try CoreDataManager.shared.delete(data: foodArray.first(where: { $0.id == product.id })!)
        }
    }
}
