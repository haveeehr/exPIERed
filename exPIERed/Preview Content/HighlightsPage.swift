//
//  ContentView.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//

import SwiftUI

struct HighlightsPage: View {
    @State var showCreationModal = false
    @StateObject var viewModel = HighlightModelView()
    var body: some View {
        NavigationView{
            VStack(spacing: 5){
                ProductList(showAddModal: $showCreationModal)
                CategoryView(products: $viewModel.products)
            }
            .background(Color(UIColor.systemGray6))
            .toolbar{
                Button {
                    showCreationModal.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showCreationModal, onDismiss: {
                
            }, content: {
                AddModal()
            })
            
        }.onChange(of: showCreationModal, perform: {_ in
            do{
               try viewModel.refetchData()
            }catch{
                //better handle the error
                print(error)
            }
        })
        .onAppear(){
            do{
                viewModel.products = try viewModel.getProducts()
            }catch{
                //better handle the error
                print(error)
            }
            NotificationManager.instance.deleteNotification()
            NotificationManager.instance.scheduleNotification(products: viewModel.products)
        }
        
    }
}

struct HighlightsPage_Previews: PreviewProvider {
    static var previews: some View {
        HighlightsPage()
    }
}
