//
//  ContentView.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//

import SwiftUI

struct HighlightsPage: View {
    @State var showCreationModal = false
    @State var products: [Product] = Product.products
    
    var body: some View {
        NavigationView{
            VStack(spacing: 5){
                ProductList()
                CategoryView(products: $products)
                
            }
            .background(Color(UIColor.systemGray6))
            .toolbar{
                Button(action: {showCreationModal.toggle()
                }, label: {Image(systemName: "plus")})
            }
            .sheet(isPresented: $showCreationModal, onDismiss: {
                products = Product.products
            }
                   , content: {
                AddModal()
            })
            
        }
        
    }
}

struct HighlightsPage_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsPage()
    }
}
