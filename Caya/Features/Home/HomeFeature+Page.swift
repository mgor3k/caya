//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

extension HomeFeature {
    enum Page {
        case home
        case profile
    }
}

extension HomeFeature.Page: Identifiable, CaseIterable {
    var id: Int {
        switch self {
        case .home:
            return 0
        case .profile:
            return 1
        }
    }
}
