//
//  SwiftUIView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 11/01/23.
//

import SwiftUI

// MARK: - CircleComponent

/// The icon component
struct CircleComponent: View {
    /// The name of the SFSymbol
    var imageName: String

    var body: some View {
        ZStack {
            Circle().frame(width: 35, height: 35).foregroundColor(.accentColor)
            Image(systemName: imageName).foregroundColor(.white)
            
        }
    }
}

// MARK: - CircleComponent_Previews

struct CircleComponent_Previews: PreviewProvider {
    static var previews: some View {
        CircleComponent(imageName: "frying.pan.fill")
    }
}
