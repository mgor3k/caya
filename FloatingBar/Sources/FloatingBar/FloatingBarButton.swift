//
//  Created by Maciej Górecki on 23/10/2021
//

import SwiftUI

struct FloatingBarButton: View {
    let namespace: Namespace.ID
    
    let image: Image
    let isSelected: Bool
    let onTapped: () -> Void
    
    var body: some View {
        Button(action: onTapped) {
            image
                .foregroundColor(.white)
                .padding(12)
                .padding(.horizontal, 8)
        }
        .frame(maxHeight: .infinity)
            .background(
                isSelected ? selectionBackground : nil
            )
            .animation(Animation.easeOut(duration: 0.1), value: isSelected)
    }
    
    var selectionBackground: some View {
        Color.white.opacity(0.3)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .matchedGeometryEffect(id: "id", in: namespace)
    }
}

struct FloatingBarButton_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        FloatingBarButton(
            namespace: namespace,
            image: Image(systemName: "person.fill"),
            isSelected: true,
            onTapped: {}
        )
            .background(Color.black)
    }
}
