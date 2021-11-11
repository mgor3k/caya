//
//  Created by Maciej Gorecki on 12/11/2021
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 48) {
                Image("credit-cards")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: proxy.size.width / 3)
                
                Text("Caya")
                    .font(.title)
                    .tracking(3)
                
                Text("Welcome\nto the best\nbudget tracking app")
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .lineSpacing(6)
            }
            .offset(y: -44)
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
