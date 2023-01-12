//
//  AddModal.swift
//  exPIERed
//
//  Created by Ramona Ruoppo on 11/01/23.
//

import SwiftUI
import Foundation

struct AddModal: View {
    @State private var nameTitle = ""
    @State private var today = Date.now
    @State private var nextDate = Calendar.current.date(byAdding: .day, value: 3, to: Date.now)!

    @State private var isOpened: Bool = false
    @State var selectedCategory: Category = .meat
    
    var body: some View {
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
    }
}

struct AddModal_Previews: PreviewProvider {
    static var previews: some View {
        AddModal()
    }
}
