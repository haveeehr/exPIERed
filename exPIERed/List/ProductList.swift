//
//  ProductList.swift
//  exPIERed
//
//  Created by Vito Gallo on 12/01/23.
//

import SwiftUI

struct ProductList: View {
    var isExpirationList: Bool = true
    var foodCategory: [Category]?
    @State private var searchText = ""
    
    var searchResults: [Product] {
        if searchText.isEmpty {
            return filterList(products: Product.products, category: foodCategory, isExpirationList: isExpirationList)
        } else {
            return Product.products.filter{$0.name.contains(searchText)}
        }
    }
    
    
    var body: some View {
        
        VStack{
            List{
                Section{
                    
                    ForEach(searchResults, id: \.self){ product in
                        
                        ProductRow(name: product.name, expirationDate: product.expiryDate)
                        
                    }
                    .onDelete(perform: delete)
                    
                } header: {
                    if isExpirationList{
                        Text("Close to expiry date")
                    }
                }
                .headerProminence(.increased)
                
            }
            .listStyle(InsetGroupedListStyle())
            .scrollDisabled(isExpirationList)
            
            
            
            if !isExpirationList{
                Spacer()
                Text("\(searchResults.count) food")
                    .font(.system(.callout))
                    .foregroundColor(.gray)
            }
        }
        .padding(.top, 3)
        .navigationTitle(isExpirationList ? "" : foodCategory!.count > 1 ? "All" : foodCategory?[0].name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(UIColor.systemGray6))
        .searchable(text: $searchText)
        
    }
    
    func delete(at offsets: IndexSet) {
        Product.products.remove(atOffsets: offsets)
    }
    
    func filterList(products: [Product], category: [Category]?, isExpirationList: Bool) -> [Product]{
        
        if isExpirationList || category == nil{
            return filterByExpirationDate(products: products)
        }else{
            return filterByCategory(products: products, selectedCategory: category!)
        }
        
    }
    
    
    func generateFutureDate() -> Date{
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.day = 7
        
        return Calendar.current.date(byAdding: dateComponent, to: currentDate) ?? Date()
    }
    
    
    func filterByExpirationDate(products: [Product]) -> [Product]{
        let futureDate: Date = generateFutureDate()
        let filteredList = products.filter{$0.expiryDate <= futureDate && $0.expiryDate > Date()}
        
        return sortByExpiryDate(products: filteredList)
    }
    
    func filterByCategory(products: [Product], selectedCategory: [Category]) -> [Product]{
        let filteredList: [Product]
        if selectedCategory.count == 1{
            filteredList = products.filter{$0.category == selectedCategory[0]}
        } else{
            filteredList = products
        }
        
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
