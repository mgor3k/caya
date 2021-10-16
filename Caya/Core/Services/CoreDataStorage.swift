//
//  Created by Maciej Górecki on 16/10/2021
//

import CoreData
import Combine

typealias PersistanceManaging = EntryProviding & EntryStoring

class CoreDataStorage {
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Model")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

extension CoreDataStorage: EntryProviding, EntryStoring {
    func getEntriesUpdates() -> AnyPublisher<[Entry], Never> {
        listenForEntryChanges()
            .map(getEntries)
            .eraseToAnyPublisher()
    }
    
    func getEntries() -> [Entry] {
        let request = CDEntry.fetchRequest()
        // TODO: Handle errors
        let fetched = try? container.viewContext.fetch(request)
        
        let mapped: [Entry]? = fetched?.compactMap { entry -> Entry? in
            guard let month = Month(Int(entry.month)), let year = Year(Int(entry.year)) else {
                return nil
            }
            
            return Entry(
                id: entry.id ?? UUID(),
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
        
        model.id = entry.id
        
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
        NotificationCenter
            .default
            .publisher(
                for: NSManagedObjectContext.didSaveObjectsNotification,
                   object: container.viewContext
            )
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
