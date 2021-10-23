//
//  Created by Maciej Górecki on 23/10/2021
//

import SwiftUI

enum HomeMenuItem: String, CaseIterable {
    case home
    case profile
    
    var id: String {
        rawValue
    }
    
    var image: Image {
        switch self {
        case .home:
            return Image(systemName: "list.bullet.rectangle.fill")
        case .profile:
            return Image(systemName: "person.fill")
        }
    }
}
