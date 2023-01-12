//
//  CategoryView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 11/01/23.
//

import SwiftUI
///The overall category view components formed by 5 different categoryFieldComponent
struct CategoryView: View {
    
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20){
                
                //The category section
                Text("Category").categoryTitleText()
                
                
                //Here starts the list of buttons
                //It was chosen to not use a forEach constuct since they are always 5 in this specific position
                HStack(spacing: 40){
                    CategoryFieldComponent(imageComponent: "frying.pan.fill", elementNumber: 0, categoryName: "Meat", callFunction: {})
                    CategoryFieldComponent(imageComponent: "fish.fill", elementNumber: 0, categoryName: "Fish", callFunction: {})
                }
                
                
                HStack(spacing: 40){
                    CategoryFieldComponent(imageComponent: "carrot.fill", elementNumber: 0, categoryName: "Vegetables", callFunction: {})
                    CategoryFieldComponent(imageComponent: "cart.fill", elementNumber: 0, categoryName: "Others", callFunction: {})
                }
                
                CategoryFieldComponent(imageComponent: "refrigerator.fill", elementNumber: 0, categoryName: "All", callFunction: {})
                
            }
        
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
