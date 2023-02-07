//
//  CategoryRow.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 07/02/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryRowData: CategoryRowData

    var body: some View {
        NavigationLink(destination: ProductList(isExpirationList: false, foodCategory: categoryRowData.choosenFoodCategory), label: {
            HStack {
                CircleComponent(imageName: categoryRowData.imageComponent)

                Text(categoryRowData.categoryName)
                    .font(.system(size: 17))

                Spacer()

                Text("\(categoryRowData.elementNumber)")
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 2)

        })
    }
}
