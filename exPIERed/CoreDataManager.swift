//
//  CoreDataManager.swift
//  exPIERed
//
//  Created by Gianluca Annina on 24/01/23.
//

import CoreData
import Foundation

class CoreDataManager {
    // MARK: Lifecycle

    private init() {
        container.loadPersistentStores { _, error in

            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    // MARK: Internal

    static let shared = CoreDataManager()

    let container = NSPersistentContainer(name: "FoodManager")

    func fetch<T: NSFetchRequestResult>(entityName: String) throws -> [T] {
        let request = NSFetchRequest<T>(entityName: entityName)

        let entities = try container.viewContext.fetch(request)

        return entities
    }

    func createNewFood(product: Product) throws {
        let newFood = FoodEntity(context: container.viewContext)

        product.copyInEntity(food: newFood)

        try saveContext()
    }

    func saveContext() throws {
        try container.viewContext.save()
    }

    func delete<T: NSFetchRequestResult>(data: T) throws {
        container.viewContext.delete(data as! NSManagedObject)

        try container.viewContext.save()
    }
}
