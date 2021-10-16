//
//  Created by Maciej Górecki on 10/10/2021
//

import Foundation

class NewEntryViewModel: ObservableObject {
    @Published var income: Double?
    @Published var expenses: Double?
    
    let currency = "PLN"
    
    func save() {
        
    }
}
