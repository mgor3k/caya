//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI
import FloatingBar

struct HomeContainerView<Content: View>: View {
    @State private var selectedMenuItem: HomeMenuItem = .home
    
    let items: [HomeMenuItem]
    
    @ViewBuilder
    var content: (HomeMenuItem) -> Content

    init(
        items: [HomeMenuItem] = HomeMenuItem.allCases,
        @ViewBuilder content: @escaping (HomeMenuItem) -> Content
    ) {
        self.items = items
        self.content = content
    }
        
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: selectedMenuItem.gradientPosition
            )
                .animation(.default, value: selectedMenuItem)
            
            content(selectedMenuItem)
            
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
                .frame(height: 150)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            
            FloatingBar(
                items: items,
                selectedItem: $selectedMenuItem
            )
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

extension HomeMenuItem: FloatingBarItem {}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainerView(items: HomeMenuItem.allCases) { item in
            Text("Test")
        }
            .environment(\.colorScheme, .dark)
    }
}
