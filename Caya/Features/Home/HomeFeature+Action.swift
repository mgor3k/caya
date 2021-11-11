//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

extension HomeFeature {
    enum Action {
        case add
        case edit(Entry)
        case showProfile(ProfileRoute)
    }
}
