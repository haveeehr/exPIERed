//
//  CategoryView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 11/01/23.
//

import SwiftUI
///The overall category view components formed by 5 different categoryFieldComponent
struct CategoryView: View {
    @State var moveToListView = false
    @State var chosenFoodCategory: [Category]? = [.meat]
    @Binding var products: [Product]
    
    var body: some View {
        NavigationLink(isActive: $moveToListView, destination:{ ProductList(isExpirationList: false, foodCategory: chosenFoodCategory, showAddModal: .constant(false))}, label: {})
        VStack(alignment: .leading, spacing: 15){
            
            //The category section
            Text("Category").categoryTitleText()
            
            
            //Here starts the list of buttons
            //It was chosen to not use a forEach constuct since they are always 5 in this specific position
            HStack(spacing: 15){
                CategoryFieldComponent(imageComponent: "frying.pan.fill", elementNumber: countProductCategory(productList: products, filterCategory: .meat), categoryName: "Meat", callFunction: {
                    chosenFoodCategory = [.meat]
                    moveToListView = true
                })
                CategoryFieldComponent(imageComponent: "fish.fill", elementNumber: countProductCategory(productList: products, filterCategory: .fish), categoryName: "Fish", callFunction: {
                    chosenFoodCategory = [.fish]
                    moveToListView = true
                })
            }
            
            
            HStack(spacing: 15){
                CategoryFieldComponent(imageComponent: "carrot.fill", elementNumber: countProductCategory(productList: products, filterCategory: .vegetables), categoryName: "Vegetables", callFunction: {
                    chosenFoodCategory = [.vegetables]
                    moveToListView = true
                })
                CategoryFieldComponent(imageComponent: "cart.fill", elementNumber: countProductCategory(productList: products, filterCategory: .others), categoryName: "Others", callFunction: {
                    chosenFoodCategory = [.others]
                    moveToListView = true
                })
            }
            
            CategoryFieldComponent(imageComponent: "refrigerator.fill", elementNumber: products.count, categoryName: "All", callFunction: {
                chosenFoodCategory = [.fish, .meat]
                moveToListView = true
            })
            
        }
        
    }
    
    
    func countProductCategorySecondSolution(productList:[Product],filterCategory: Category) -> Int {
        var numberOfCorrespondingProduct = 0
        for product in productList{
            if (product.category == filterCategory) {
                numberOfCorrespondingProduct += 1
            }
        }
        return numberOfCorrespondingProduct
    }
    
    func countProductCategory(productList:[Product],filterCategory: Category) -> Int {
        return productList.filter({$0.category == filterCategory}).count
    }
}
//
//struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView(products: Product.products)
//    }
//}
