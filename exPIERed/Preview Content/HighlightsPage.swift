//
//  ContentView.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//

import SwiftUI

// MARK: - HighlightsPage

struct HighlightsPage: View {
    @State var showCreationModal = false
    @StateObject var viewModel = HighlightModelView()

    var product: [Product] {
        viewModel.products
    }

    var productsWithin7Days: [Product] {
        return viewModel.products
            .sorted {
                $0.expiryDate < $1.expiryDate
            }
            .filter {
                $0.expiryDate < Calendar.current.date(byAdding: .day, value: 7, to: Date())!
            }
    }

    var body: some View {
        NavigationView {
            VStack {
                if product.isEmpty {
                    EmptyView()
                }
                else {
                    List {
                        Section {
                            CategoryListView(products: $viewModel.products)
                        } header : {
                            Text("Category")
                        }.headerProminence(.increased)

                        if !productsWithin7Days.isEmpty {
                            Section {
                                ForEach(productsWithin7Days, id: \.self) { product in
                                    ProductRow(name: product.name, expirationDate: product.expiryDate)
                                }
                                .onDelete(perform: delete)
                            } header: {
                                Text("Expires soon")
                            }
                        }
                    }.listStyle(.insetGrouped)
                }
            }
            .toolbar {
                Button {
                    showCreationModal.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showCreationModal, onDismiss: {}, content: {
                AddModal(selectedCategory: .meat)
            })
            .onAppear {
                do {
                    viewModel.products = try viewModel.getProducts()
                }
                catch {
                    // TODO: better handle the error
                    print(error)
                }
                NotificationManager.instance.deleteNotification()
                NotificationManager.instance.scheduleNotification(products: productsWithin7Days)
            }
        }
        .onChange(of: showCreationModal, perform: { _ in
            do {
                try viewModel.refetchData()
            }
            catch {
                // TODO: better handle the error
                print(error)
            }
        })
    }

    func delete(at offsets: IndexSet) {
        offsets.sorted(by: >).forEach { i in
            try! viewModel.deleteFood(product: productsWithin7Days[i])
        }
        try! viewModel.refetchData()
    }
}

// MARK: - HighlightsPage_Previews

struct HighlightsPage_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsPage()
    }
}
