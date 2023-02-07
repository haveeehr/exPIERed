//
//  HeaderView.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 06/02/23.
//

import SwiftUI

// MARK: - HeaderView

struct HeaderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - HeaderView_Previews

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "")
    }
}
