//
//  SwiftUIView.swift
//  exPIERed
//
//  Created by Gianluca Annina on 11/01/23.
//

import SwiftUI

///The icon component
struct CircleComponent: View {
    ///The name of the SFSymbol
    var imageName:String
    var body: some View {
        ZStack{
            Circle().frame(width: 30,height: 30).foregroundColor(.blue)
            Image(systemName: imageName).foregroundColor(.white).font(.system(size: 14))
        }
    }
}

struct CircleComponent_Previews: PreviewProvider {
    static var previews: some View {
        CircleComponent(imageName: "frying.pan.fill")
    }
}
