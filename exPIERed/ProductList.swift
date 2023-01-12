//
//  ProductList.swift
//  exPIERed
//
//  Created by Vito Gallo on 12/01/23.
//

import SwiftUI

struct ProductList: View {
    var isExpirationList: Bool = true
    
    var body: some View {
        List(filterList(products: Product.products, isExpirationList: isExpirationList)){ product in
            
            ProductRow(name: product.name, date: product.expiryDate)
        }
    }
    
    func filterList(products: [Product], category: Category = .meat, isExpirationList: Bool) -> [Product]{
        
        if isExpirationList {
            return filterByExpirationDate(products: products)
        }else{
            return filterByCategory(products: products, selectedCategory: category)
        }
        
    }
    
    
    func genrateFutureDate() -> Date{
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 7
        
        return Calendar.current.date(byAdding: dateComponent, to: currentDate) ?? Date()
    }

    
    func filterByExpirationDate(products: [Product]) -> [Product]{
        let futureDate: Date = genrateFutureDate()
        let filteredList = products.filter{$0.expiryDate <= futureDate}
        
        return sortByExpiryDate(products: filteredList)
    }
    
    func filterByCategory(products: [Product], selectedCategory: Category) -> [Product]{
        let filteredList = products.filter{$0.category == selectedCategory}
        
        return sortByExpiryDate(products: filteredList)
    }
    
    
    func sortByExpiryDate(products: [Product]) -> [Product]{
        return products.sorted{$0.expiryDate < $1.expiryDate}
                               
    }
}

struct ProductList_Previews: PreviewProvider {
    static var previews: some View {
        ProductList()
    }
}
