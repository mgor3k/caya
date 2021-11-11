//
//  Created by Maciej Gorecki on 11/11/2021
//

import FloatingBar
import SwiftUI

extension HomeStore.Page: Identifiable, FloatingBarItem {
    var id: Int {
        switch self {
        case .home:
            return 0
        case .profile:
            return 1
        }
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
