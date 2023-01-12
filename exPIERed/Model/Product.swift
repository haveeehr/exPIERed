//
//  Product.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//
import Foundation

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var dateCreated = Date()
    var expiryDate: Date
    var isOpened: Bool
    var category: Category
    
    static var products: [Product] = [
        Product(name: "Chicken AIA", expiryDate: Date().addingTimeInterval(60*60*24*5), isOpened: false, category: .meat),
        Product(name: "Tacchino", expiryDate: Date().addingTimeInterval(60*60*24*10), isOpened: true, category: .meat),
        Product(name: "Banana", expiryDate: Date().addingTimeInterval(60*60*24), isOpened: false, category: .fruit),
        Product(name: "Insalata", expiryDate: Date(), isOpened: true, category: .vegetables)
    ]
}

enum Category {
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




