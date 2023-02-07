//
//  EmptyView.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 06/02/23.
//

import SwiftUI

// MARK: - EmptyView

struct EmptyView: View {
    var body: some View {
        Text("List is empty, let's add some food!")
    }
}

// MARK: - EmptyView_Previews

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
