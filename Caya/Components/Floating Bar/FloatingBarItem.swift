//
//  Created by Maciej Górecki on 23/10/2021
//

import SwiftUI

protocol FloatingBarItem: Identifiable, Equatable {
    var image: Image { get }
}

struct PreviewFloatingBarItem: FloatingBarItem {
    var id = UUID()
    
    var image: Image {
        Image(systemName: "list.bullet.rectangle.fill")
    }
}
