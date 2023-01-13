//
//  CategoryExtensions.swift
//  exPIERed
//
//  Created by Gianluca Annina on 12/01/23.
//

import SwiftUI

extension Text{
    func categoryTitleText() -> Text{
        self.font(.system(size:22,weight:.bold, design: .rounded)).foregroundColor(.black)
    }
    
    func categoryNameText() -> Text{
        self.font(.system(size:18,weight:.semibold, design: .rounded)).foregroundColor(.gray)
    }
    
    func categoryNumberText() -> Text{
        self.font(.system(size:28,weight:.bold, design: .rounded)).foregroundColor(.black)
    }
}
