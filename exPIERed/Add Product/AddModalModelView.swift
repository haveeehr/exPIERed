//
//  AddModalModelView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 02/02/23.
//

import Foundation
extension AddModal{
    class AddModalModelView:ObservableObject{
        
        func createNewFood(product:Product) throws{
            try CoreDataManager.shared.createNewFood(product: product)
        }
        
        
    }
}
