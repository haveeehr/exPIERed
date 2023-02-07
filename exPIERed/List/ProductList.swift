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
    @State var showAddModal: Bool = false
    @StateObject var modelViewModel = ProductListModelView()

    var searchResults: [Product] {
        do {
            let productsArray = try modelViewModel.getProducts()
            if modelViewModel.searchText.isEmpty {
                return modelViewModel.filterList(products: productsArray, category: foodCategory, isExpirationList: isExpirationList)
            }
            else {
                return productsArray.filter { $0.name.contains(modelViewModel.searchText) }
            }
        }
        catch {
            // TODO: better handle the error
            print(error)
            return []
        }
    }

    var body: some View {
        VStack {
            List {
                Section {
                    ForEach(searchResults, id: \.self) { product in
                        ProductRow(name: product.name, expirationDate: product.expiryDate)
                    }
                    .onDelete(perform: delete)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .scrollDisabled(isExpirationList)

            if !isExpirationList {
                Spacer()
                Text("\(searchResults.count) Item\(searchResults.count > 1 ? "s" : "")")
                    .font(.system(.callout))
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(isExpirationList ? "" : foodCategory!.count > 2 ? "All" : foodCategory?[0].name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $modelViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .toolbar {
            Button {
                showAddModal.toggle()
            } label: {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $showAddModal, onDismiss: {}, content: {
            AddModal(selectedCategory: foodCategory?.first ?? .meat)
        })
    }

    func delete(at offsets: IndexSet) {
        offsets.sorted(by: >).forEach { i in
            try! modelViewModel.deleteFood(product: searchResults[i])
        }
    }
}
