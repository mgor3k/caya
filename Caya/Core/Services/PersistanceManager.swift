//
//  Created by Maciej Górecki on 16/10/2021
//

import CoreData
import Combine

// TODO: Make separate
protocol PersistanceManaging {
    func getEntries() -> [Entry]
    func storeEntry(_ entry: Entry)
    func listenForEntryChanges() -> AnyPublisher<Void, Never>
}

// TODO: Remove this
extension PersistanceManaging {
    func listenForEntryChanges() -> AnyPublisher<Void, Never> {
        Just(()).eraseToAnyPublisher()
    }
}

// TODO: Change name to coredatastorage
class PersistanceManager {
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

extension PersistanceManager: PersistanceManaging {
    func getEntries() -> [Entry] {
        let request = CDEntry.fetchRequest()
        // TODO: Handle errors
        let fetched = try? container.viewContext.fetch(request)
        
        let mapped: [Entry]? = fetched?.compactMap { entry -> Entry? in
            guard let month = Month(Int(entry.month)), let year = Year(Int(entry.year)) else {
                return nil
            }
            
            return Entry(
                date: .init(
                    month: month,
                    year: year
                ),
                income: entry.income,
                expenses: entry.expenses,
                taxes: []
            )
        }
        
        return mapped ?? []
    }
    
    // TODO: Should be tested
    func storeEntry(_ entry: Entry) {
        let model = CDEntry(context: container.viewContext)
        
        if let expenses = entry.expenses {
            model.expenses = expenses
        }
        
        if let income = entry.income {
            model.income = income
        }
        
        model.month = Int32(entry.date.month.value)
        model.year = Int32(entry.date.year.value)
        
        do {
            try container.viewContext.save()
        } catch {
            // TODO: Some error handling?
            print(error.localizedDescription)
        }
    }
    
    func listenForEntryChanges() -> AnyPublisher<Void, Never> {
        let notification = NSManagedObjectContext.didSaveObjectsNotification
        return NotificationCenter
            .default
            .publisher(for: notification, object: container.viewContext)
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
