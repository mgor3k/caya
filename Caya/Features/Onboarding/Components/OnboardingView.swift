//
//  Created by Maciej Górecki on 17/10/2021
//

import SwiftUI

struct OnboardingView<Content: View>: View {
    @ViewBuilder
    var content: () -> Content
    
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: .bottom
            )
            
            TabView {
                content()
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .foregroundColor(.white)
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView {
            Color.blue
        }
    }
}
