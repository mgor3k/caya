//
//  Created by Maciej Gorecki on 11/11/2021
//

import Foundation

final class HomeStore: ObservableObject {
    typealias Page = HomeFeature.Page
    
    let pages: [Page]
    
    @Published var currentPage: Page

    init(pages: [Page] = Page.allCases) {
        self.pages = pages
        self.currentPage = pages[0]
    }
}
