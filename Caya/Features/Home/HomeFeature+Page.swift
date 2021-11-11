//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation
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
    
    var gradientPosition: GradientBackgroundView.Position {
        switch self {
        case .home:
            return .leading
        case .profile:
            return .center
        }
    }
}
