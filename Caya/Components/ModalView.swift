//
//  Created by Maciej Górecki on 23/10/2021
//

import SwiftUI

struct ModalView<Content: View>: View {
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.white)
                .frame(width: 32, height: 2)
                .cornerRadius(12)
                .padding(.top, 8)
            
            content()
            Spacer()
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView {
            EmptyView()
        }
    }
}
