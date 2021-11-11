//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

struct PreviewCreditsRepository: CreditsRepositoryProtocol {
    let credits: [Credit]
    
    func fetchCredits() async -> [Credit] {
        credits
    }
}
