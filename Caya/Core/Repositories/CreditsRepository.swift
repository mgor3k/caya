//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

protocol CreditsRepositoryProtocol {
    func fetchCredits() async -> [Credit]
}

final class CreditsRepository: CreditsRepositoryProtocol {
    func fetchCredits() async -> [Credit] {
        [.init(value: "App Icon\n[Made by Ctrlastudio](https://www.flaticon.com/authors/ctrlastudio)")]
    }
}
