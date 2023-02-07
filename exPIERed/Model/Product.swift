//
//  Product.swift
//  exPIERed
//
//  Created by Javier Fransiscus on 11/01/23.
//
import Foundation

// MARK: - Product

struct Product: Identifiable, Hashable {
    // MARK: Lifecycle

    init(name: String, dateCreated: Date = Date(), expiryDate: Date, isOpened: Bool, category: Category) {
        self.name = name
        self.dateCreated = dateCreated
        self.expiryDate = expiryDate
        self.isOpened = isOpened
        self.category = category
    }

    init(food: FoodEntity) {
        name = food.name ?? ""
        dateCreated = food.dateCreated ?? Date()
        expiryDate = food.expiryDate ?? Date()
        isOpened = food.isOpened
        category = Category.getCategory(category: food.category ?? "")
        id = food.id ?? UUID()
    }

    // MARK: Internal

    var id = UUID()
    var name: String
    var dateCreated = Date()
    var expiryDate: Date
    var isOpened: Bool
    var category: Category

    func copyInEntity(food: FoodEntity) {
        food.name = name
        food.category = category.name
        food.isOpened = isOpened
        food.expiryDate = expiryDate
        food.dateCreated = dateCreated
        food.id = id
    }
}

// MARK: - Category

enum Category: CaseIterable {
    case meat
    case fish
    case greens
    case others

    // MARK: Internal

    var name: String {
        switch self {
        case .meat:
            return "Meat"
        case .fish:
            return "Fish"
        case .greens:
            return "Greens"
        case .others:
            return "Others"
        }
    }

    static func getCategory(category: String) -> Category {
        if category == "Meat" {
            return .meat
        }
        else if category == "Fish" {
            return .fish
        }
        else if category == "Greens" {
            return .greens
        }
        else if category == "Others" {
            return .others
        }
        return .others
    }
}
