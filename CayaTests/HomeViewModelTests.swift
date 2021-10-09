//
//  Created by Maciej Górecki on 10/10/2021
//

import XCTest
@testable import Caya

class HomeViewModelTests: XCTestCase {
    func test_calculateTotalSavings() async throws {
        let sut = HomeViewModel(
            provider: Provider()
        )
        
        await sut.fetchHistory()
        
        XCTAssertEqual(sut.savings, -2_500)
    }
}

private extension HomeViewModelTests {
    struct Provider: HistoryProviding {
        func getHistory() async -> [HistoryEntry] {
            [
                .init(month: .init(1)!, year: .init(2009)!, income: 5_000, expenses: 300, taxes: [("1", 100)]),
                .init(month: .init(2)!, year: .init(2009)!, income: 2_000, expenses: 9_000, taxes: [("1", 200)]),
                .init(month: .init(3)!, year: .init(2009)!, income: 1_000, expenses: 600, taxes: [("1", 300)])
            ]
        }
    }
}
