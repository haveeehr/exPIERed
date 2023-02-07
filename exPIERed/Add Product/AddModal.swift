//
//  AddModal.swift
//  exPIERed
//
//  Created by Ramona Ruoppo on 11/01/23.
//

import Foundation
import SwiftUI

// MARK: - AddModal

struct AddModal: View {
    @Environment(\.dismiss) var dismiss

    @State var nameTitle = ""
    @State var today = Date.now
    @State var nextDate = Calendar.current.date(byAdding: .day, value: 3, to: Date.now) ?? Date.now
    @State var isOpened: Bool = false
    @State var selectedCategory: Category
    @StateObject var viewModel = AddModalModelView()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $nameTitle)

                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases, id: \.self) { category in
                            Text(category.name).tag(category.name)
                        }
                    }
                    .pickerStyle(.menu)

                    Toggle("Opened", isOn: $isOpened)
                    DatePicker("Expiry Date", selection: isOpened ? $nextDate : $today, in: Date()..., displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .disabled(isOpened)
                }
            }
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if !nameTitle.isEmpty {
                            getItem()
                        }
                        dismiss()
                    } label: {
                        Text("Add")
                            .fontWeight(.semibold)
                    }.disabled(nameTitle.isEmpty)
                }
            }
        }
    }

    func getItem() {
        let expiryDate = isOpened ? nextDate : today
        let newItem = Product(name: nameTitle, expiryDate: expiryDate, isOpened: isOpened, category: selectedCategory)
        do {
            try viewModel.createNewFood(product: newItem)
        }
        catch {
            // better handle the error
            print(error)
        }
    }
}

// MARK: - AddModal_Previews

struct AddModal_Previews: PreviewProvider {
    static var previews: some View {
        AddModal(selectedCategory: .greens)
    }
}
