//
//  AddModal.swift
//  exPIERed
//
//  Created by Ramona Ruoppo on 11/01/23.
//

import SwiftUI
import Foundation


struct AddModal: View {
    @Environment(\.dismiss) var dismiss

    @State var nameTitle = ""
    @State var today = Date.now
    @State var nextDate = Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!

    @State var isOpened: Bool = false
    @State var selectedCategory: Category = .meat
    
//    @State var itemList = [Product]()
    
   
    var body: some View {
        NavigationView {
            List {

                    TextField("Name", text: $nameTitle)

                    Picker("Category", selection: $selectedCategory) {
                        Text(Category.meat.name).tag(Category.meat)
                        Text(Category.fish.name).tag(Category.fish)
                        Text(Category.vegetables.name).tag(Category.vegetables)
                        Text(Category.fruit.name).tag(Category.fruit)
                        Text(Category.others.name).tag(Category.others)
                    }
                    .pickerStyle(.menu)

                    
                    Toggle("Opened", isOn: $isOpened)
                    if isOpened {
                        DatePicker("Expiry Date", selection: $nextDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .disabled(true)
                    } else {
                        DatePicker("Expiry Date", selection: $today, displayedComponents: .date)
                            .datePickerStyle(.compact)
                    }
                }
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if nameTitle != "" {
                        Button("Add") {
                            dismiss()
//                            getItem()
                        }
                    } else {
                        Button("Add") {
                            dismiss()
                        }
                        .disabled(true)
                    
                    }
                }
            }
        }
        
        }
    
    func getItem() {
        let newItem = Product(name: nameTitle, expiryDate: today, isOpened: isOpened, category: selectedCategory)

        Product.products.append(newItem)
        print("works")
    }

}

struct AddModal_Previews: PreviewProvider {
    static var previews: some View {
        AddModal()
    }
}
