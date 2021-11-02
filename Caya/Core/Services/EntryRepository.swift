//
//  Created by Maciej Gorecki on 02/11/2021
//

import Foundation
import Combine
import CoreDataStorage
import CoreData

protocol EntryRepositoryProtocol {
    func getEntries() -> [Entry]
    func getEntriesUpdates() -> AnyPublisher<[Entry], Never>
    func removeEntries(_ entries: [Entry])
    
    func storeEntry(_ entry: Entry)
    func updateEntry(withUUID uuid: UUID, entry: Entry)

}

final class EntryRepository: EntryRepositoryProtocol {
    private let storage: CoreDataStorage
    
    // TODO: To be removed
    private var context: NSManagedObjectContext {
        storage.context
    }
    
    init(storage: CoreDataStorage) {
        self.storage = storage
    }
}

extension EntryRepository {
    func getEntries() -> [Entry] {
        (try? storage.fetch(CDEntry.fetchRequest(), map: \.toEntry)) ?? []
    }
    
    func getEntriesUpdates() -> AnyPublisher<[Entry], Never> {
        listenForEntryChanges()
            .map(getEntries)
            .eraseToAnyPublisher()
    }
    
    func removeEntries(_ entries: [Entry]) {
        let request = CDEntry.fetchRequest()
        // TODO: Handle errors

        let idsToRemove = entries.map(\.id)

        do {
            let fetched = try context.fetch(request)
            let toDelete = fetched.filter { idsToRemove.contains($0.id!) }
            for object in toDelete {
                context.delete(object)
            }
            try context.save()
        } catch {

        }
    }
    
    func listenForEntryChanges() -> AnyPublisher<Void, Never> {
        NotificationCenter
            .default
            .publisher(
                for: NSManagedObjectContext.didSaveObjectsNotification,
                   object: context
            )
            .map { _ in }
            .eraseToAnyPublisher()
    }
}

extension EntryRepository {
    func updateEntry(withUUID uuid: UUID, entry: Entry) {
         //TODO: Do more core data way
        let request = CDEntry.fetchRequest()
        // TODO: Handle errors
        let fetched = try? context.fetch(request)
        
        if let fetchedEntry = fetched?.first(where: { $0.id == uuid }) {
            if let expenses = entry.expenses {
                fetchedEntry.expenses = expenses
            }
            
            if let income = entry.income {
                fetchedEntry.income = income
            }
            
            do {
                try context.save()
            } catch {
                fatalError()
            }
            
        } else {
            fatalError()
        }
    }
    
    func storeEntry(_ entry: Entry) {
        let model = CDEntry(context: context)

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
            try context.save()
        } catch {
            // TODO: Some error handling?
            print(error.localizedDescription)
        }
    }
}

private extension CDEntry {
    var toEntry: Entry? {
        guard let month = Month(Int(month)), let year = Year(Int(year)) else {
            return nil
        }
        
        return Entry(
            id: id ?? UUID(),
            date: .init(
                month: month,
                year: year
            ),
            income: income,
            expenses: expenses,
            taxes: []
        )
    }
}
