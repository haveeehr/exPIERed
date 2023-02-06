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
    @Binding var showAddModal:Bool
    @StateObject var modelViewModel:ProductListModelView = ProductListModelView()
    var searchResults: [Product] {
        do{
            let productsArray = try modelViewModel.getProducts()
            if modelViewModel.searchText.isEmpty {
                return modelViewModel.filterList(products: productsArray, category: foodCategory, isExpirationList: isExpirationList)
            } else {
                return productsArray.filter{$0.name.contains(modelViewModel.searchText)}
            }
        }catch{
            //better handle the error
            print(error)
           return []
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
        .searchable(text: $modelViewModel.searchText)

        
        
    }
    func delete(at offsets: IndexSet) {
        offsets.sorted(by: > ).forEach { (i) in
            try! modelViewModel.deleteFood(product: searchResults[i])
        }
    }
   
}

//struct ProductList_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductList()
//    }
//}
