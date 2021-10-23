//
//  Created by Maciej Górecki on 23/10/2021.
//

import SwiftUI

struct PreviewFloatingBarItem: FloatingBarItem {
    var id = UUID()
    
    var image: Image {
        Image(systemName: "list.bullet.rectangle.fill")
    }
}
