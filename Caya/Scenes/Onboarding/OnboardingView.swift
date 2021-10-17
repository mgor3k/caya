//
//  Created by Maciej Górecki on 17/10/2021
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: .bottom
            )
            
            GeometryReader { proxy in
                TabView {
                    page1(proxy: proxy).tag(0)
                    page2.tag(1)
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .foregroundColor(.white)
            }
        }
    }
}

private extension OnboardingView {
    func page1(proxy: GeometryProxy) -> some View {
        VStack(spacing: 24) {
            // TODO: Add image
            Color.blue
                .frame(maxHeight: proxy.size.height / 2)
            
            Text("Get inspired")
                .font(.title)
                .tracking(2)
            
            Text("Something something")
            
            Spacer()
        }
        .padding(CGFloat?.defaultPadding)
    }
    
    var page2: some View {
        Text("haha")
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
