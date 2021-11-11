//
//  Created by Maciej Górecki on 02/10/2021
//

import SwiftUI
import FloatingBar

struct HomeView<Content: View>: View {
    typealias Page = HomeFeature.Page
    
    @StateObject private var store: HomeStore
    
    @ViewBuilder
    var content: (Page) -> Content

    init(
        pages: [Page] = Page.allCases,
        @ViewBuilder content: @escaping (Page) -> Content
    ) {
        self._store = StateObject(wrappedValue: HomeStore(pages: pages))
        self.content = content
    }
        
    var body: some View {
        ZStack {
            GradientBackgroundView(
                position: store.currentPage.gradientPosition
            )
                .animation(.default, value: store.currentPage)
            
            content(store.currentPage)
            
            LinearGradient(colors: [.black.opacity(0.9), .clear], startPoint: .bottom, endPoint: .top)
                .frame(height: 150)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
            
            FloatingBar(
                items: store.pages,
                selectedItem: $store.currentPage
            )
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView { item in
            switch item {
            case .home:
                Text("Home")
            case .profile:
                Text("Profile")
            }
        }
            .environment(\.colorScheme, .dark)
    }
}
