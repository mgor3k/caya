//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

final class CreditsStore: ObservableObject {
    @Published var credits: [Credit] = []
    
    private let repository: CreditsRepositoryProtocol
    
    init(repository: CreditsRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetch() async {
        credits = await repository.fetchCredits()
    }
}
