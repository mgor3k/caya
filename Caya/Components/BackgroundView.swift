//
//  Created by Maciej Górecki on 10/10/2021
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Color.background
            
            VStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                .gradient1,
                                .gradient1,
                                .gradient1,
                                .gradient2,
                                .gradient2
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 300, height: 300)
                    .drawingGroup()
                    .blur(radius: 80)
                    .offset(y: -220)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
