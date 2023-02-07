//
//  CategoryListView.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 06/02/23.
//

import SwiftUI

// MARK: - CategoryRowData

struct CategoryRowData: Hashable {
    var imageComponent: String
    var elementNumber: Int
    var categoryName: String
    var choosenFoodCategory: [Category]
}

// MARK: - CategoryListView

struct CategoryListView: View {
    @State var moveToListView = false
    @State var chosenFoodCategory: [Category]? = [.meat]
    @Binding var products: [Product]

    var body: some View {
        let categoryRowData: [CategoryRowData] = [
            CategoryRowData(imageComponent: "frying.pan.fill",
                            elementNumber: countProductCategory(productList: products, filterCategory: [.meat]),
                            categoryName: "Meat",
                            choosenFoodCategory: [.meat]),
            CategoryRowData(imageComponent: "fish.fill",
                            elementNumber: countProductCategory(productList: products, filterCategory: [.fish]),
                            categoryName: "Fish",
                            choosenFoodCategory: [.fish]),
            CategoryRowData(imageComponent: "carrot.fill",
                            elementNumber: countProductCategory(productList: products, filterCategory: [.greens]),
                            categoryName: "Greens",
                            choosenFoodCategory: [.greens]),
            CategoryRowData(imageComponent: "cart.fill",
                            elementNumber: countProductCategory(productList: products, filterCategory: [.others]),
                            categoryName: "Others",
                            choosenFoodCategory: [.others]),
            CategoryRowData(imageComponent: "refrigerator.fill",
                            elementNumber: products.count,
                            categoryName: "All",
                            choosenFoodCategory: [.fish, .meat, .greens, .others]),
        ]

        ForEach(categoryRowData, id: \.self) { datum in
            if datum.elementNumber != 0 {
                CategoryRow(categoryRowData: datum)
            }
        }
    }

    func countProductCategory(productList: [Product], filterCategory: [Category]) -> Int {
        return productList.filter { filterCategory.contains($0.category) }.count
    }
}
