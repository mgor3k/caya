//
//  Created by Maciej Górecki on 01/11/2021.
//

import CoreData

public final class CoreDataStorage {
    let container: NSPersistentContainer
    
    public var context: NSManagedObjectContext {
        container.viewContext
    }
    
    public init(name: String?) {
        container = NSPersistentContainer(name: name ?? "")
        if name == nil {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

extension CoreDataStorage: PersistanceStore {
    public func fetch<T, V>(_ fetchRequest: NSFetchRequest<T>, map: @escaping (T) throws -> V?) throws -> [V] {
        let context = container.viewContext
        do {
            let fetched = try context.fetch(fetchRequest)
            let mapped = try fetched.compactMap(map)
            return mapped
        } catch {
            throw error
        }
    }
}
