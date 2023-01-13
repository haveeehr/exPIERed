//
//  Product.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//
import Foundation

struct Product: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var dateCreated = Date()
    var expiryDate: Date
    var isOpened: Bool
    var category: Category
    
    static var products: [Product] = [
        Product(name: "Chicken AIA", expiryDate: Date().addingTimeInterval(60*60*24*2), isOpened: false, category: .meat),
        Product(name: "Turkey", expiryDate: Date().addingTimeInterval(-60*60*24*5), isOpened: true, category: .meat),
        Product(name: "Banana", expiryDate: Date().addingTimeInterval(60*60*24*4), isOpened: false, category: .fruit),
        Product(name: "Salad", expiryDate: Date().addingTimeInterval(60*60*24*10), isOpened: true, category: .vegetables),
        Product(name: "Tuna fillet", expiryDate: Date().addingTimeInterval(-60*60*24*20), isOpened: false, category: .fish),
        Product(name: "Carrots", expiryDate: Date().addingTimeInterval(60*60*24*23), isOpened: true, category: .vegetables),
        Product(name: "Pineapple", expiryDate: Date().addingTimeInterval(60*60*24*5), isOpened: false, category: .fruit),
        Product(name: "Swordfish", expiryDate: Date().addingTimeInterval(-60*60*24*5), isOpened: true, category: .fish),
        Product(name: "Chicken Nuggets", expiryDate: Date().addingTimeInterval(60*60*24*9), isOpened: false, category: .meat),
        Product(name: "Tacchino", expiryDate: Date().addingTimeInterval(-60*60*24*10), isOpened: true, category: .meat),
        Product(name: "Avocado", expiryDate: Date().addingTimeInterval(60*60*24*7), isOpened: false, category: .fruit),
        Product(name: "Eggplant", expiryDate: Date().addingTimeInterval(60*60*24*11), isOpened: true, category: .vegetables),
        Product(name: "Biscuits", expiryDate: Date().addingTimeInterval(60*60*24*11), isOpened: true, category: .others),
        Product(name: "White bread", expiryDate: Date().addingTimeInterval(60*60*24*19), isOpened: true, category: .others)

    ]
}

enum Category: CaseIterable {
    case meat
    case fish
    case vegetables
    case fruit
    case others
    
    var name: String {
        switch self {
        case .meat:
            return "Meat"
        case .fish:
            return "Fish"
        case .vegetables:
            return "Vegetables"
        case .fruit:
            return "Fruit"
        case .others:
            return "Others"
        }
    }
}




