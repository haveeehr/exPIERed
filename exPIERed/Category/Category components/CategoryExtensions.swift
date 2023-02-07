//
//  CategoryExtensions.swift
//  exPIERed
//
//  Created by Gianluca Annina on 12/01/23.
//

import SwiftUI

extension Text {
    func categoryTitleText() -> Text {
        font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(.primary)
    }

    func categoryNameText() -> Text {
        font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(.secondary)
    }

    func categoryNumberText() -> Text {
        font(.system(size: 28, weight: .bold, design: .rounded)).foregroundColor(.primary)
    }
}
