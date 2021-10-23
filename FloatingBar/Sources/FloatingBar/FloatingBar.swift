//
//  Created by Maciej Górecki on 23/10/2021
//

import SwiftUI

public struct FloatingBar<Item: FloatingBarItem>: View {
    @Namespace private var namespace
    
    let items: [Item]
    @Binding var selectedItem: Item
    
    public init(items: [Item], selectedItem: Binding<Item>) {
        self.items = items
        self._selectedItem = selectedItem
    }
    
    public var body: some View {
        HStack(spacing: 32) {
            ForEach(items) { item in
                FloatingBarButton(
                    namespace: namespace,
                    image: item.image,
                    isSelected: selectedItem == item,
                    onTapped: {
                        selectedItem = item
                    }
                )
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .frame(height: 80)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

struct FloatingBar_Previews: PreviewProvider {
    static var previews: some View {
        let items: [PreviewFloatingBarItem] = [
            .init(), .init()
        ]
        return FloatingBar(items: items, selectedItem: .constant(items.first!))
            .environment(\.colorScheme, .dark)
            .padding()
            .background(Color.white)
    }
}
