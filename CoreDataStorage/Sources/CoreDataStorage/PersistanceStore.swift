//
//  Created by Maciej Górecki on 01/11/2021.
//

import CoreData

public protocol PersistanceStore {
    func fetch<T, V>(_ fetchRequest: NSFetchRequest<T>, map: @escaping (T) throws -> V?) throws -> [V]
}
