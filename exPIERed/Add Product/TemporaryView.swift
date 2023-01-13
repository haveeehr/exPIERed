//
//  TemporaryView.swift
//  exPIERed
//
//  Created by Ramona Ruoppo on 12/01/23.
//

import SwiftUI

struct TemporaryView: View {
    @State private var showingSheet: Bool = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            AddModal()
        }
    }
    
}

struct TemporaryView_Previews: PreviewProvider {
    static var previews: some View {
        TemporaryView()
    }
}
