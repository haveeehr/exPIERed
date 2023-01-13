//
//  CategoryFieldComponent.swift
//  exPIERed
//
//  Created by Gianluca Annina on 11/01/23.
//

import SwiftUI
///The category button struct
struct CategoryFieldComponent: View {
    ///The name of the SFSymbol to show
    var imageComponent:String
    
    ///The number of element in that specific category
    var elementNumber:Int
    
    ///The name of the category
    var categoryName:String
    
    ///The function that will be called when pressing the button passed as a parameter
    var callFunction: () -> Void
    
    
    var body: some View {
        
        Button(action: callFunction, label:{
            VStack(alignment: .leading,spacing: 5){
                //The top part of the button
                HStack{
                    //The symbol of the button
                    CircleComponent(imageName: imageComponent)
                    
                    Spacer()
                    
                    //The number of elements
                    Text("\(elementNumber)").categoryNumberText()
                }
                //The name of the category
                Text(categoryName)
                    .categoryNameText()
            }
            .frame(maxWidth: 135)
            .padding()
            .background(.white)
            .cornerRadius(10)
            
            
            
        })
    }}

struct CategoryFieldComponent_Previews: PreviewProvider {
    
    static func dummyFunction(){
    }
    
    static var previews: some View {
        CategoryFieldComponent(imageComponent: "fish.circle.fill", elementNumber: 10, categoryName: "All", callFunction: dummyFunction)
    }
}
