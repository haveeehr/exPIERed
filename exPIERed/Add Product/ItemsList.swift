//
//  ItemsList.swift
//  exPIERed
//
//  Created by Ramona Ruoppo on 12/01/23.
//

import SwiftUI

struct ItemsList: View {
    @State private var showingSheet: Bool = false
    
    @State var products = [Product]()
    
    var body: some View {
        VStack {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                AddModal()
            }
            
            List {
                ForEach (Product.products, id:\.self) { product in
                    VStack {
                        Text(product.name)
                    }
                    
                }
            }
        }
        
        
    }
}

struct ItemsList_Previews: PreviewProvider {
    static var previews: some View {
        ItemsList()
    }
}
